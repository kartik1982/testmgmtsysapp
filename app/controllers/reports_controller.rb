class ReportsController < ApplicationController

def index
  ids = Report.select("MAX(id) AS id").group(:testcase_id).collect(&:id)
  @reports = Report.where(:id => ids).paginate(page: params[:page], per_page: 20)
  @reports_without_pagination=Report.order("created_at DESC").where(:id => ids)
  @reports = @reports.order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 20)
  @testsuites = Testsuite.all
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
  if params[:release_id] !=""
    @reports = @reports.where("release_id=?", params[:release_id])
  end
  if params[:testcycle_id] !=""
    @reports = @reports.where("testcycle_id=?", params[:testcycle_id])
  end
  if params[:project_id] != ""
    @reports = @reports.where("project_id=?", params[:project_id])
  end
  ids = @reports.select("MAX(id) AS id").group(:testcase_id).collect(&:id)
  @reports=@reports.order("created_at DESC").where(:id => ids)
  @testcase_count=0
  @testsuites.each do |testsuite|
    @testcase_count += testsuite.testcases.count
  end
end
def testsuite
  @testsuite= Testsuite.find(params[:id])
  @reports = Report.where(testsuite_id: @testsuite.id)
  if params[:release_id] !=""
    @reports = @reports.where("release_id=?", params[:release_id])
  end
  if params[:testcycle_id] !=""
    @reports = @reports.where("testcycle_id=?", params[:testcycle_id])
  end
  ids = @reports.select("MAX(id) AS id").group(:testcase_id).collect(&:id)
  @reports=@reports.order("#{sort_column} #{sort_direction}").where(:id => ids)
end
def releases
  @releases = Release.all
  @releases = @releases.order("title DESC")
  @reports = Report.all
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
    params.require(:report).permit(:release_id, :project_id, :testcycle_id, :testsuite_id, :testcase_id, :start_at, :end_at, :pass, :fail, :pending, :comment, :log_path, :build)
  end
  def apply_filters(params, redirect_page)
      @testsuites= Testsuite.all
      @testcase_count=0
      @testsuites.each do |testsuite|
        @testcase_count += testsuite.testcases.count
      end
      @reports = Report.all
      if params[:release_id] !=""
        @reports = @reports.where("release_id=?", params[:release_id])
      end
      if params[:testcycle_id] !=""
        @reports = @reports.where("testcycle_id=?", params[:testcycle_id])
      end
      if params[:project_id] != ""
        @reports = @reports.where("project_id=?", params[:project_id])
      end
      ids = @reports.select("MAX(id) AS id").group(:testcase_id).collect(&:id)
      @reports_without_pagination=@reports.order("created_at DESC").where(:id => ids)
      @reports = @reports.order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 20)
      render redirect_page
  end
  def sort_column
    Report.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
