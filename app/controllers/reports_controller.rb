class ReportsController < ApplicationController

def index
@reports = Report.all
if params !=nil
    if params[:release_id] !=""
      @reports = @reports.where("release_id=?", params[:release_id])
    end
    if params[:testcycle_id] !=""
      @reports = @reports.where("testcycle_id=?", params[:testcycle_id])
    end
    if params[:project_id] != ""
      @reports = @reports.where("project_id=?", params[:project_id])
    end
  end
  ids = @reports.select("MAX(id) AS id").group(:testcase_id).collect(&:id)
  @reports_without_pagination=@reports.order("created_at DESC").where(:id => ids)
  @reports=@reports.order("created_at DESC").where(:id => ids).paginate(page: params[:page], per_page: 20)
  # @reports = @reports.order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 20)
  # @reports = @reports.order("fail DESC").where(:id => ids).paginate(page: params[:page], per_page: 20)
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
end
def releases
  @releases = Release.all
  @releases = @releases.order("title ASC")

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

  def sort_column
    Report.column_names.include?(params[:sort]) ? params[:sort] : "pass"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
