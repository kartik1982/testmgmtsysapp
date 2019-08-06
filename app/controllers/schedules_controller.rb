class SchedulesController < ApplicationController

  def index

  end
  def testsuites
    @testsuites = Testsuite.all
  end
  def testcases
    @testcases = Testcase.all
  end
  def testcase
    @testcase = Testcase.find(params[:id])
  end
  def testsuite
    @testsuite = Testsuite.find(params[:id])
  end
  def scheduletestsuite
    redirect_to schedules_path
  end
  def scheduletestcase
    render json: params
    # redirect_to schedules_path
  end
  def scheduletestsuites
    render json: params
    # redirect_to schedules_path
  end
  def scheduletestcases
    render json: params
    # redirect_to schedules_path
  end

  # private
  # def schedule_params
  #   params.permit(:job_name, :schedule_cron, :worker, :testcase_name, :browser, :os, :testuser, :testpassword, :testpath, :runstatus)
  # end

end
