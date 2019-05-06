class TestcyclesController < ApplicationController
  before_action :require_super_admin_user
def index
  @testcycles = Testcycle.all
end
def create
  @testcycle = Testcycle.new(testcycle_params)
  @testcycle.user = current_user
  if @testcycle.save
    flash[:notice]="Testcycle Added successfully"
    redirect_to testcycle_path(@testcycle)
    # redirect_to root_path
  else
    render 'new'
  end
end

def new
  @testcycle = Testcycle.new

end

def show
  @testcycle= Testcycle.find(params[:id])
end

def edit
  @testcycle = Testcycle.find(params[:id])
end

def update
  @testcycle = Testcycle.find(params[:id])
  @testcycle.updated_by = current_user.email
  if @testcycle.update(testcycle_params)
    flash[:notice]="Testcycle Updated successfully"
    redirect_to testcycle_path(@testcycle)
  else
    render 'edit'
  end
end

def destroy
  @testcycle= Testcycle.find(params[:id])
  if @testcycle.destroy
    flash[:danger]="Testcycle Deleted successfully"
    redirect_to testcycles_path
  else

  end
end

private
def testcycle_params
  params.require(:testcycle).permit(:title, :description, :active, :project_ids => [])
end
end
