require 'jenkins_api_client'
class JenkinsTestsuiteTaskWorker

  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  sidekiq_options retry: false

  def perform(testexecution_ids)
    # @testsuite = Testsuite.find_by(title: args['testsuite_name'])
    # @testsuite.testcases.each do |testcase|
    #   opts ={ release: args['release'], environment: args['environment'], browser: args['browser'], testcase: testcase.testpath, testuser: testcase.testuser, testpassword: testcase.testpassword }
    #   puts opts
    # end

    # opts ={ release: args['release'], environment: args['environment'], browser: args['browser'], testsuite_name: args['testsuite_name'] }
    # args={
    #   release: params[:release_name],
    #   environment: params[:testcycle_name],
    #   browser: params[:browser],
    #   testcase: params[:testpath],
    #   testuser: params[:testuser],
    #   testpassword: params[:testpassword]
    # }
    # JenkinsTaskWorker.perform_async(@testexecution.id, args)
    testexecution_ids.each do |testexecution_id|
      job= JenkinsTaskWorker.perform_async(testexecution_id)
      # sleep 20
      job_status = Sidekiq::Status::status(job)
      sleep 60
      puts "*********************"
      puts job_status
      # puts "*******************************************************************************"
      # puts container.status
      # sleep 20
      # container = SidekiqStatus::Container.load(job)
      # puts container.status
      # sleep 20
      # container = SidekiqStatus::Container.load(job)
      # puts container.status
      # puts "*******************************************************************************"
    end
  end

end
