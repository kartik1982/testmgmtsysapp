class TestcasesController <ApplicationController

def index
    @testcases= Testcase.order("title ASC").paginate(page: params[:page], per_page: 25)
end

def create
  # render plain: params[:testcase].inspect
 @testcase = Testcase.new(testcase_params)
 @testcase.created_by = current_user.email

 if @testcase.save
  flash[:success]="Testcase Added successfully"
  redirect_to testcase_path(@testcase)
    @testcase.testsuite.sequence.push(@testcase.id.to_s)
    @testcase.testsuite.save
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
  @reports = Report.where("testcase_name=?", @testcase.title).order("created_at DESC").paginate(page: params[:page], per_page: 100)
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
  @reports = Report.where("testcase_id=?", params[:id]).delete_all
  @testcase= Testcase.find(params[:id])
  @testcase.testsuite.sequence.delete(@testcase.id.to_s)
  @testcase.testsuite.save
  if @testcase.destroy
    flash[:danger]="Testcase Deleted successfully"
    redirect_to testcases_path
  else

  end
end
private
def testcase_params
  params.require(:testcase).permit(:title, :description, :runmode, :testsuite_id, :user_id, :testuser, :testpassword, :testpath, :array_serial)
end
end
