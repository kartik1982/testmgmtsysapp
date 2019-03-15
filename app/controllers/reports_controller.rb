class ReportsController < ApplicationController

def index
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
  @reports_without_pagination=@reports.where("created_at in (select max(created_at))").group("testcase_id")
  @reports=@reports.where("created_at in (select max(created_at))").group("testcase_id").paginate(page: params[:page], per_page: 10)
  # @reports=@reports.order("created_at ASC").group("testcase_id").paginate(page: params[:page], per_page: 10)
end

def new
  @report = Report.new
end

def create
  @report = Report.new(report_params)
  if @report.save
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
end
