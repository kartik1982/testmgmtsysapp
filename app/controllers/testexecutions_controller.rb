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
    when 5; @status= "Cancelled"
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
def submittestsuite
    @testsuite = Testsuite.find(params[:testsuite])
end
def submission
  @testcase = Testcase.find(params[:testcase])
end
def triggertestsuite
  @testsuite = Testsuite.find_by(title: params[:testsuite_name])
  @testexecution_ids=[]
  @testsuite.testcases.each do |testcase|
    @testexecution = Testexecution.new(release_name: params[:release_name], testcycle_name: params[:testcycle_name], testsuite_name: params[:testsuite_name], testcase_name: testcase.title, browser: params[:browser], os: params[:os], testuser: testcase.testuser, testpassword: testcase.testpassword, testpath: testcase.testpath, runstatus: 1)
    if @testexecution.save
      @testexecution_ids << @testexecution.id
    else
      flash[:danger]="somthing went wronmg with" +testcase.title
    end
  end
  JenkinsTestsuiteTaskWorker.perform_async(@testexecution_ids)
  redirect_to testexecutions_path
end

def trigger
  # render json: params
    @testexecution = Testexecution.new(testexecution_params)
    if @testexecution.save
     flash[:success]="Testcase Submitted successfully"
    else
     render 'submission'
    end
  JenkinsTaskWorker.perform_async(@testexecution.id)
  redirect_to testexecutions_path
end
def canceltask
  JenkinsCancelTaskWorker.perform_async(params[:format])
  redirect_to testexecutions_path
end
private
def testexecution_params
  params.permit(:release_name, :testcycle_name, :testsuite_name, :testcase_name, :browser, :os, :testuser, :testpassword, :testpath, :runstatus)
end

end