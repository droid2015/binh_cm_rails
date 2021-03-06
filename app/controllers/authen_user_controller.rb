class AuthenUserController < ApplicationController
  def new
  end
  #Xử lý post login
  def create
  	user=User.find_by(email: params[:session][:email].downcase)  
    if user && user.authenticate(params[:session][:password])
      
      log_in user
      #Lưu cookies
      if params[:session][:remember_me]=='1'
        remember(user)
      else
        forget (user)
      end  
      redirect_back_or contacts_path
    else
      flash[:danger] = "Đăng nhập thất bại"
      render 'new'
    end
  end
  # Logout
  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
