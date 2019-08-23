require 'jenkins_api_client'
class JenkinsCancelTaskWorker

  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'critical'

  def perform(execution_id)
    puts execution_id
    execution = Testexecution.find(execution_id)
    puts execution.runstatus
    #jenkins server information
    server_ip = ENV['JENKINS_SERVER_IP_ADDRESS']
    user_name = ENV['JENKINS_SERVER_USER']
    user_password = ENV['JENKINS_SERVER_PASSWORD']
    job_name = ENV['JENKINS_JOB_NAME']
    build_num = execution.build_num
    begin
        @client = JenkinsApi::Client.new(server_ip: server_ip, username: user_name, password: user_password)
        # if execution.runstatus==2 || execution.runstatus==1
          @client.job.stop_build(job_name, build_num = build_num)
          execution.runstatus = 5
          execution.save
        # end
    rescue => e
      if e.to_s.include? "No builds for RUN_SINGLE_SCRIPT"
        execution.runstatus = 5
        execution.save
      end
    end
  end
end
