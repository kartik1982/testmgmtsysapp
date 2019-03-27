class TestcasesController <ApplicationController

def index
    @testcases= Testcase.all
end

def create
  # render plain: params[:testcase].inspect
 @testcase = Testcase.new(testcase_params)
 @testcase.created_by = current_user.email

 if @testcase.save
  flash[:success]="Testcase Added successfully"
  redirect_to testcase_path(@testcase)

 else
  render 'new'
 end

end

def new
  @testcase = Testcase.new
end

def edit
  @testcase = Testcase.find(params[:id])
end

def show
  @testcase= Testcase.find(params[:id])
  @reports = @testcase.reports.order("created_at DESC").paginate(page: params[:page], per_page: 10)
end

def update
  @testcase = Testcase.find(params[:id])
  @testcase.updated_by = current_user.email
  if @testcase.update(testcase_params)
    flash[:notice]="Testcase Updated successfully"
    redirect_to testcase_path(@testcase)
  else
    render 'edit'
  end
end

def destroy
  @testcase= Testcase.find(params[:id])
  if @testcase.destroy
    flash[:danger]="Testcase Deleted successfully"
    redirect_to testcases_path
  else

  end
end
private
def testcase_params
  params.require(:testcase).permit(:title, :description, :runmode, :testsuite_id, :user_id)
end
end
