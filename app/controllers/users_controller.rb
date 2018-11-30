class UsersController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
			redirect_to root_path, flash: {success: op_ok}
		else
			flash.now[:error] = op_fail
			render :new
		end
	end

	private
	
	def user_params
		params.permit(:name, :email, :password, :password_confirmation, :password_digest)
	end  
end