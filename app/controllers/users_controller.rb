class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]
skip_before_action :require_user, only: [:new]
before_action :require_same_user, only: [:edit, :update]
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="User added successfully"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit

  end

  def show

  end

  def update
    if @user.update(user_params)
      flash[:notice]="User Updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'

    end
  end

  def destroy
    if @user.destroy
      flash[:danger]="User Deleted successfully"
      redirect_to users_path
    else

    end
  end

  private
  def set_user
      @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin, :super_admin, :password, :password_confirmation)
  end

  def require_same_user
    if current_user != @user
      if !super_admin?
        flash[:notice] = "You can edit your own profile"
        redirect_to user_path(current_user)
      end
      end
  end
end
