class JenkinsTaskJob < ApplicationJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    Rails.logger.debug "#{self.class.name}: I am performing my job with arguments: #{args.inspect}"
  end
end
