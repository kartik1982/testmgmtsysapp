require 'jenkins_api_client'
class JenkinsTaskWorker

  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(execution_id)
    #jenkins server information
    server_ip = ENV['JENKINS_SERVER_IP_ADDRESS']
    user_name = ENV['JENKINS_SERVER_USER']
    user_password = ENV['JENKINS_SERVER_PASSWORD']
    job_name = ENV['JENKINS_JOB_NAME']
    execution = Testexecution.find(execution_id)
    begin
        @client = JenkinsApi::Client.new(server_ip: server_ip, username: user_name, password: user_password)
        testcase =  Testcase.find_by(title: execution.testcase_name)
        opts ={ project: testcase.testsuite.project.title,
                release: execution.release_name,
                environment: execution.testcycle_name,
                browser: execution.browser,
                testcase: execution.testpath,
                testuser: execution.testuser,
                testpassword: execution.testpassword }
        if testcase.array_serial?
          device = Device.find_by(serial: testcase.array_serial)
          opts = opts.merge!( serial: testcase.array_serial,
                              telnet: device.device_telnet
                            )
        end

        build_num = @client.job.build(job_name, opts, {'build_start_timeout' => 45000})

        execution.runstatus = 2
        execution.build_num=build_num
        execution.save
        while @client.job.get_build_details(job_name, build_num).to_s.include?("building\"=>true") do
          sleep 10
          json = @client.job.get_console_output(job_name, build_num = build_num, start = 0, mode = 'text').to_json
          parsed= JSON.parse(json.encode('UTF-8', invalid: :replace, undef: :replace))
          # puts parsed["output"]
          execution.runlog = parsed["output"] #eval(json)
          execution.save
        end
        if (@client.job.get_build_details(job_name, build_num).to_s.include?("result\"=>\"ABORTED"))
          execution.runstatus = 5
        else
          execution.runstatus = 3
        end
        execution.save

    rescue => e
      while @client.job.get_build_details(job_name, build_num).to_s.include?("building\"=>true") do
        sleep 10
      end
      execution.runlog = e
      execution.runstatus = 4
      execution.save
    end
  end
end
