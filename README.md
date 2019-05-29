# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
RESQUE TO HANDLE JOBS
1# add into gemfile - gem 'resque'
2# Install and run redis-server
Add following file config/initializer/resque.rb with "Resque.redis = 'localhost:6379'"
3# Add into config/application.rb file - config.active_job.queue_adapter = :resque
4# add rake file in lib/tasks - 'resque.rake'
add following into resque.rake file
##################
require 'resque/tasks'
task "resque:setup" => :environment do
  Resque.before_fork = Proc.new do |job|
    ActiveRecord::Base.connection.disconnect!
  end
  Resque.after_fork = Proc.new do |job|
    ActiveRecord::Base.establish_connection
  end
end
###########################
Running worker
LOGGING=1 QUEUE=* bundle exec ke resque:work
