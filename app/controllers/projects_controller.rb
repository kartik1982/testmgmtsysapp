class ProjectsController < ApplicationController
def index
  @projects = Project.all
end
def create
  @project = Project.new(project_params)
  if @project.save
    flash[:notice]="Project Added successfully"
    redirect_to project_path(@project)
    # redirect_to root_path
  else
    render 'new'
  end
end

def new
  @project = Project.new

end

def show
  @project= Project.find(params[:id])
end

def edit
  @project = Project.find(params[:id])
end

def update
  @project = Project.find(params[:id])
  if @project.update(project_params)
    flash[:notice]="Project Updated successfully"
    redirect_to project_path(@project)
  else
    render 'edit'
  end
end

def destroy
  @project= Project.find(params[:id])
  if @project.destroy
    flash[:danger]="Project Deleted successfully"
    redirect_to projects_path
  else

  end
end

private
def project_params
  params.require(:project).permit(:title, :description, :active)
end
end
