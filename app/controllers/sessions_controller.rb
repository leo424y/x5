class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
			redirect_to root_path, flash: {success: op_ok}
    else
			flash.now[:error] = op_fail
			render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, flash: {success: op_ok}
  end
 end