class ApplicationController < ActionController::Base
  before_action :require_user

def require_user
  if !logged_in?
    flash[:notice] ="You must logged in to perform action"
    redirect_to login_path
  end
end

helper_method :current_user, :logged_in?, :admin?, :super_admin?, :sort_column, :sort_direction
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end

  def super_admin?
    if logged_in?
      current_user.super_admin
    end
  end
  def admin?
    if logged_in?
      current_user.admin
    end
  end
  def require_super_admin_user
      if !super_admin?
        flash[:notice] = "Only Super Admin can perform specific action"
        redirect_to root_path
      end
  end
end
