class Admin::UsersController < ApplicationController
	before_action :check_admin

	def index
		@users = User.page(params[:page]).per(5)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    if @user.save
			redirect_to admin_users_path, flash: {success: op_ok}
		else
			flash.now[:error] = op_fail
			render :new
		end
	end

	def edit
  	@user = User.find_by(id: params[:id])
	end

	def update
  	@user = User.find_by(id: params[:id])
		if @user.update(user_params)
			redirect_to admin_users_path, flash: {success: op_ok}
		else
			flash.now[:error] = op_fail
			render :edit
		end
	end

	def destroy
		User.destroy(params[:id])
		redirect_to admin_users_path, flash: {success: op_ok}
	end

  private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest, :role)
	end  
end