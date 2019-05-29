require 'jenkins_api_client'
class JenkinsTaskWorker

  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(*args)
    #jenkins server information
    server_ip = '10.100.185.11'
    user_name = 'kartik'
    user_password = 'Kartik@123'
    job_name = "RUN_SINGLE_SCRIPT"
    @client = JenkinsApi::Client.new(server_ip: server_ip, username: user_name, password: user_password)
    # opts ={ release: args[:release], environment: args[:environment], browser: args[:browser], testacse: args[:testacse], testuser: args[:testuser], testpassword: args[:testpassword] }
    build_num = @client.job.build(job_name, args, {'build_start_timeout' => 3000})
    puts @client.job.get_build_details(job_name, build_num)
    puts @client.job.get_console_output(job_name, build_num = 0, start = 0, mode = 'text')
    while @client.job.get_build_details(job_name, build_num).to_s.include?("building\"=>true") do
      sleep 20
    end
    puts @client.job.get_console_output(job_name, build_num = 0, start = 0, mode = 'text')
    puts @client.job.get_build_details(job_name, build_num)
  end
end
