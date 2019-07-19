class TestsuitesController < ApplicationController

  def index
    @testsuites = Testsuite.order("title ASC").paginate(page: params[:page], per_page: 25)
  end

  def create
    @testsuite = Testsuite.new(testsuite_params)
    @testsuite.created_by = current_user.email
    if @testsuite.save
      flash[:notice]="Testsuite Added successfully"
      redirect_to testsuite_path(@testsuite)
      # redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @testsuite = Testsuite.new
  end

  def edit
    @testsuite= Testsuite.find(params[:id])
  end

  def show
    @testsuite= Testsuite.find(params[:id])
  end

  def order
    @testsuite= Testsuite.find(params[:id])
    @testsuite.sequence= params[:testcase_ids]
    if @testsuite.save
      flash[:notice]= "Testcase Order Saved!!!"
      redirect_to testsuite_path
    else
    flash[:danger]= "Something wrong"
  end
    # render json: params[:testcase_ids]
  end

  def update
    @testsuite = Testsuite.find(params[:id])
    @testsuite.updated_by = current_user.email
    if @testsuite.update(testsuite_params)
      flash[:notice]="Testsuite Updated successfully"
      redirect_to testsuite_path(@testsuite)
    else
      render 'edit'

    end
  end

  def destroy
    @testsuite= Testsuite.find(params[:id])
    if @testsuite.destroy
      flash[:danger]="Testsuite Deleted successfully"
      redirect_to testsuites_path
    else

    end
  end

  private
  def testsuite_params
    params.require(:testsuite).permit(:title, :description, :runmode, :user_id, :project_id, :comment)
  end
end
