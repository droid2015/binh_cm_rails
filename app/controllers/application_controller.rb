class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include AuthenUserHelper
  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:danger] = "Please log in."
        redirect_to login_url
  	end
  end
  def admin_login
  	unless admin?
  		store_location
  		flash[:danger] = "Please log in by admin."
        redirect_to login_url
  	end
  end  
end
