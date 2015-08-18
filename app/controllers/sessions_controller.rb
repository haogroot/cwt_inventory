class SessionsController < ApplicationController
  def new
  end

  def create
    user = Userinfo.find_by(studentID: params[:session][:studentID])
    if user && user.authenticate(params[:session][:password])
      # Log the user in 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
  end

  def destroy
  end
end
