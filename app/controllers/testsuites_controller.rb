class TestsuitesController < ApplicationController

  def index
    @testsuites = Testsuite.all
  end

  def create
    @testsuite = Testsuite.new(testsuite_params)
    @testsuite.user = current_user
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

  def update
    @testsuite = Testsuite.find(params[:id])
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
    params.require(:testsuite).permit(:title, :description, :runmode)
  end
end
