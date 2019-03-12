class ReportsController < ApplicationController

def index
    @reports = Report.all
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
  params.require(:report).permit(:release_id, :project_id, :testsuite_id, :testcase_id, :start_at, :end_at, :pass, :fail, :pending, :comment, :log_path, :build)
end
end
