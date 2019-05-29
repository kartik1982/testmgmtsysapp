class TestexecutionsController < ApplicationController

def new

end

def index

end

def edit

end

def show

end

def update
end
def testcases
  @testcases = Testcase.all
end

def testsuites
  @testsuites = Testsuite.all
end

def trigger
  args={
    release: '9.2.0',
    environment: 'Regression',
    browser: 'chrome',
    testacse: 'TS_Portals/TC_Expired_Portals.rb',
    testuser: 'expired+portal+automation+xms+admin@xirrus.com',
    testpassword: 'Qwerty1@'
  }
  JenkinsTaskWorker.perform_async(args)
  render 'show'

end

end
