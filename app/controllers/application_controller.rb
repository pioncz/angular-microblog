class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    return @current_user
  end

  def is_authenticated
    if !current_user
      #redirect_to 'login', :flash => { :notice => 'Unauthorized' }
      render 'auth/login'
    end
  end
end
