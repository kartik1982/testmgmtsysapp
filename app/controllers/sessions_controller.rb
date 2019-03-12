class SessionsController < ApplicationController
skip_before_action :require_user, only: [:new, :create]
def new

end

def create
  user = User.find_by(email: params[:sessions][:email].downcase)
  if user && user.authenticate(params[:sessions][:password])
    session[:user_id] = user.id
    flash[:notice] = "Log in successful"
    redirect_to root_path
  else
    flash[:notice] = "Something was wrong with login credentials"
    render 'new'
  end
end

def destroy
  session[:user_id]=nil
  flash[:notice] = "Loout successful"
  redirect_to login_path
end

end
