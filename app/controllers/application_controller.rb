class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 

  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
  end 

  helper_method :current_user 

  def authenticate_user! 
   redirect_to '/login' unless current_user 
  end

  def check_login
    unless current_user
      flash[:warning] = 'You must be logged in to see this page'
      redirect_to '/login'
    end  
  end

  def op_ok(msg = nil)
    msg ||= I18n.t "ok"
  end

  def op_fail(msg = nil)
    msg ||= I18n.t "retry"
  end
end
