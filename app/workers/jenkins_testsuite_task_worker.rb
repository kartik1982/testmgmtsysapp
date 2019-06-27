require 'jenkins_api_client'
class JenkinsTestsuiteTaskWorker

  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  sidekiq_options retry: false

  def perform(testexecution_ids)
    testexecution_ids.each do |testexecution_id|
      job= JenkinsTaskWorker.new.perform(testexecution_id)
    end
  end
end
