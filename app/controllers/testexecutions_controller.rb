class TestexecutionsController < ApplicationController

def new

end

def index
  @testexecutions = Testexecution.paginate(page: params[:page], per_page: 10).order("created_at DESC")
  @completed = @testexecutions.where("runstatus=?", 3).count
  @pending = @testexecutions.where("runstatus=?", 1).count
  @running = @testexecutions.where("runstatus=?", 2).count
  @error = @testexecutions.where("runstatus=?", 4).count
  @cancelled = @testexecutions.where("runstatus=?", 5).count
end

def edit

end

def show
  @testexecution = Testexecution.find(params[:id])
  case @testexecution.runstatus
    when 1; @status= "Pending"
    when 2; @status= "Running"
    when 3; @status= "Completed"
    when 4; @status= "Error"
  else @status="Unknown"
  end
end

def update
end
def testcases
  @testcases = Testcase.all
end

def testsuites
  @testsuites = Testsuite.all
end
def submission
  @testcase = Testcase.find(params[:testcase])
end
def trigger
  # render json: params
    @testexecution = Testexecution.new(testexecution_params)
    if @testexecution.save
     flash[:success]="Testcase Submitted successfully"
     redirect_to testexecutions_path
    else
     render 'submission'
    end
  args={
    release: params[:release_name],
    environment: params[:testcycle_name],
    browser: params[:browser],
    testcase: params[:testpath],
    testuser: params[:testuser],
    testpassword: params[:testpassword]
  }
  JenkinsTaskWorker.perform_async(@testexecution.id, args)
end

private
def testexecution_params
  params.permit(:release_name, :testcycle_name, :testsuite_name, :testcase_name, :browser, :os, :testuser, :testpassword, :testpath, :runstatus)
end

end
