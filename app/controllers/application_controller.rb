class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 

  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
  end 

  def is_admin?
    current_user.role == 'admin'
  end

  helper_method :current_user 

  def authenticate_user! 
   redirect_to login_path unless current_user 
  end

  def check_login
    unless current_user
      flash[:warning] = 'You must be logged in to see this page'
      redirect_to login_path
    end  
  end

  def check_admin
    unless current_user && is_admin?
      flash[:warning] = 'You must be admin to see this page'
      redirect_to errors_file_not_found_path
    end  
  end  

  def op_ok(msg = nil)
    msg ||= I18n.t "ok"
  end

  def op_fail(msg = nil)
    msg ||= I18n.t "retry"
  end
end
