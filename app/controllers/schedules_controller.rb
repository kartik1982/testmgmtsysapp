class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end
  def show
    @schedule = Schedule.find(params[:id])
  end
  def edit
    @schedule = Schedule.find(params[:id])
  end
  def update
  end
  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      flash[:success]="Schedule Deleted successfully"
      redirect_to schedules_path
    else
      flash[:danger] ="Something went wrong"
    end
  end
  def testsuites
    @testsuites = Testsuite.all
  end
  def testcases
    @testcases = Testcase.all
  end
  def testcase
    @testcase = Testcase.find(params[:id])
    @schedule = Schedule.new
  end
  def testsuite
    @testsuite = Testsuite.find(params[:id])
  end
  def scheduletestsuite
    job_name = params[:testsuite_name]
    worker_name = "schedule_testsuite_worker"
    testcase_name = "all"
    schedule_cron =""
    everyselected_days = false
    if params[:everyselected_days]
      everyselected_days = true
    end
    days = []
    if params[:days]
      params[:days].each do |index, day|
        days << index
      end
    end

    if Schedule.find_by(job_name: job_name)
      flash[:success]="Job is already scheduled first delete existing one!!!"
    else
      @testsuiteschedule = Schedule.new(job_name: job_name, worker_name: worker_name, release_name: params[:release_name],
            testcycle_name: params[:testcycle_name], testsuite_name: params[:testsuite_name], testcase_name: testcase_name,
            browser: params[:browser], os: params[:os], schedule_cron: schedule_cron, status: true, date: params[:date],
            time: params[:time], days: days, everyselected_days: everyselected_days)
      if @testsuiteschedule.save
        flash[:success]="Testsuite Scheduled successfully"
      else
        flash[:danger]="Something went wrong"
      end
    end
    redirect_to schedules_path
  end
  def scheduletestcase
    # render json: params
    job_name = params[:testcase_name]+ "-" +params[:testsuite_name]
    worker_name = "schedule_testcase_worker"
    schedule_cron =""
    everyselected_days = false
    if params[:everyselected_days]
      everyselected_days = true
    end
    days = []
    if params[:days]
      params[:days].each do |index, day|
        days << index
      end
    end

    if Schedule.find_by(job_name: job_name)
      flash[:success]="Job is already scheduled first delete existing one!!!"
    else
      @testcaseschedule = Schedule.new(job_name: job_name, worker_name: worker_name, release_name: params[:release_name],
            testcycle_name: params[:testcycle_name], testsuite_name: params[:testsuite_name], testcase_name: params[:testcase_name],
            browser: params[:browser], os: params[:os], schedule_cron: schedule_cron, status: true, date: params[:date],
            time: params[:time], days: days, everyselected_days: everyselected_days)
      if @testcaseschedule.save
        flash[:success]="Testcase Scheduled successfully"
      else
        flash[:danger]="Something went wrong"
      end
    end
    redirect_to schedules_path
  end
  def scheduletestsuites
    render json: params
    # redirect_to schedules_path
  end
  def scheduletestcases
    render json: params
    # redirect_to schedules_path
  end

  private
  def schedule_params
    params.permit(:release_name, :testcycle_name, :browser, :os, :testsuite_name, :date, :time)
  end

end
