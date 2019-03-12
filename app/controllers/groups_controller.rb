class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice]="Group Added successfully"
      redirect_to group_path(@group)
      # redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @group = Group.new

  end

  def show
    @group= Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice]="Group Updated successfully"
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end

  def destroy
    @group= Group.find(params[:id])
    if @group.destroy
      flash[:danger]="Group Deleted successfully"
      redirect_to groups_path
    else

    end
end
private
def group_params
  params.require(:group).permit(:title, :description, :active)
end
end
