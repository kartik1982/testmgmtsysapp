require 'jenkins_api_client'
class JenkinsTaskWorker

  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(execution_id)
    #jenkins server information
    server_ip = '10.100.185.11'
    user_name = 'kartik'
    user_password = 'Kartik@123'
    job_name = "RUN_SINGLE_SCRIPT"
    execution = Testexecution.find(execution_id)
    begin
        @client = JenkinsApi::Client.new(server_ip: server_ip, username: user_name, password: user_password)
        opts ={ release: execution.release_name, environment: execution.testcycle_name, browser: execution.browser, testcase: execution.testpath, testuser: execution.testuser, testpassword: execution.testpassword }
        build_num = @client.job.build(job_name, opts, {'build_start_timeout' => 3000})

        execution.runstatus = 2
        execution.build_num=build_num
        execution.save
        # puts @client.job.get_build_details(job_name, build_num)
        # puts @client.job.get_console_output(job_name, build_num = 0, start = 0, mode = 'text')
        while @client.job.get_build_details(job_name, build_num).to_s.include?("building\"=>true") do
          sleep 10
          json = @client.job.get_console_output(job_name, build_num = build_num, start = 0, mode = 'text').to_json
          execution.runlog = json #eval(json)
          execution.save
        end
        if (@client.job.get_build_details(job_name, build_num).to_s.include?("result\"=>\"ABORTED"))
          execution.runstatus = 5
        else
          execution.runstatus = 3
        end
        execution.save
        # puts @client.job.get_console_output(job_name, build_num = 0, start = 0, mode = 'text')
        # puts @client.job.get_build_details(job_name, build_num)
    rescue => e
      execution.runlog = e
      execution.runstatus = 4
      execution.save
    end
  end
end
