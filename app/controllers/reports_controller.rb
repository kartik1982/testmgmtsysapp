class ReportsController < ApplicationController

def index
  @testsuites = Testsuite.all
  @reports = Report.all
  if params[:release_name]
    if params[:release_name] !=""
      @reports = @reports.where("release_name=?", params[:release_name])
    end
    if params[:testcycle_name] !=""
      @reports = @reports.where("testcycle_name=?", params[:testcycle_name])
    end
    if params[:project_name] != ""
      @reports = @reports.where("project_name=?", params[:project_name])
      @testsuites = @testsuites.where("project_id=?", Project.find_by(title: params[:project_name]))
    end
  end
  ids = @reports.select("MAX(id) AS id").group(:testpath).collect(&:id)
  @reports=@reports.order("created_at DESC").where(:id => ids)
  @reports_without_pagination= @reports
  @reports = @reports.paginate(page: params[:page], per_page: 100)
  # @reports = testsuite_report_path@reports.order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 20)
  @testcase_count=0
  @testsuites.each do |testsuite|
    @testcase_count += testsuite.testcases.count
  end
end

def filter
  apply_filters(params, 'reports/index')
end
def testsuites
  @testsuites = Testsuite.all
  @testsuites = @testsuites.order("title ASC")
  @reports = Report.all
  if params[:release_name]
    if params[:release_name] !=""
      @reports = @reports.where("release_name=?", params[:release_name])
    end
    if params[:testcycle_name] !=""
      @reports = @reports.where("testcycle_name=?", params[:testcycle_name])
    end
    if params[:project_name] != ""
      @reports = @reports.where("project_name=?", params[:project_name])
      @testsuites = @testsuites.where("project_id=?", Project.find_by(title: params[:project_name]))
    end
  end
  ids = @reports.select("MAX(id) AS id").group(:testpath).collect(&:id)
  @reports=@reports.order("created_at DESC").where(:id => ids)
  @testcase_count=0
  @testsuites.each do |testsuite|
    @testcase_count += testsuite.testcases.count
  end
  respond_to do |format|
    format.js {render partial:'reports/testsuites'}
    format.html
  end
end
def testsuite
  @testsuite= Testsuite.find(params[:id])
  @reports = Report.where(testsuite_name: @testsuite.title)
  if params[:release_name]
    if params[:release_name] !=""
      @reports = @reports.where("release_name=?", params[:release_name])
    end
    if params[:testcycle_name] !=""
      @reports = @reports.where("testcycle_name=?", params[:testcycle_name])
    end
  end
  ids = @reports.select("MAX(id) AS id").group(:testpath).collect(&:id)
  @reports=@reports.order("#{sort_column} #{sort_direction}").where(:id => ids)
end
def releases
  @releases = Release.all.order("title DESC")
  @reports = Report.all
  if params[:release_name]
    if params[:release_name] != ""
      @releases = @releases.where(title: params[:release_name]).order("title DESC")
      @reports = @reports.where(release_name: params[:release_name])
    end
  end
  respond_to do |format|

    format.js {render partial:'reports/release'} #render partial: 'reports/release',  collection: @releases
        format.html
  end
end

def new
  @report = Report.new
end

def create
  @report = Report.new(report_params)
  if @report.save    @reports = Report.all

    flash[:notice]="Report Added successfully"
    redirect_to reports_path
  else
    render 'new'
  end
end


def edit
  @report= Report.find(params[:id])
end

def show
  @report= Report.find(params[:id])
end

def update
  @report = Report.find(params[:id])
  if @report.update(report_params)
    flash[:notice]="Report Updated successfully"
    redirect_to reports_path
  else
    render 'edit'

  end
end

def destroy
  @report= Report.find(params[:id])
  if @testsuite.destroy
    flash[:danger]="Report Deleted successfully"
    redirect_to reports_path
  else

  end
end

private
  def report_params
    params.require(:report).permit(:release_name, :project_name, :testcycle_name, :testsuite_name, :testcase_name, :start_at, :end_at, :pass, :fail, :pending, :comment, :log_path, :build, :os, :browser, :testuser, :testpassword, :testpath, :array_serial, :duration)
  end
  def apply_filters(params, redirect_page)
      @testsuites= Testsuite.all
      @testcase_count=0
      @testsuites.each do |testsuite|
        @testcase_count += testsuite.testcases.count
      end
      @reports = Report.all
      if params[:release_name] !=""
        @reports = @reports.where("release_name=?", params[:release_name])
      end
      if params[:testcycle_name] !=""
        @reports = @reports.where("testcycle_name=?", params[:testcycle_name])
      end
      if params[:project_name] != ""
        @reports = @reports.where("project_name=?", params[:project_name])
      end
      ids = @reports.select("MAX(id) AS id").group(:testpath).collect(&:id)
      @reports_without_pagination=@reports.order("created_at DESC").where(:id => ids)
      @reports = @reports.order("created_at DESC").paginate(page: params[:page], per_page: 20)
      # @reports = @reports.order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 20)
      render redirect_page
  end
end
