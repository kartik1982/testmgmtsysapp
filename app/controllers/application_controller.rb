class ApplicationController < ActionController::Base
  before_action :require_user

def require_user
  if !logged_in?
    flash[:notice] ="You must logged in to perform action"
    redirect_to login_path
  end
end

helper_method :current_user, :logged_in?, :super_admin?
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
end
