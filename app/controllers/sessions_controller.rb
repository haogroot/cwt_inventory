class SessionsController < ApplicationController
  def new
  end

  def create
    user = UserInfo.find_by(studentID: params[:session][:studentID])
    if user && user.authenticate(params[:session][:password])
      # Log the user in 
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
