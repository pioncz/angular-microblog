class AuthController < ApplicationController
  def register
    if request.post?
      a = User.new
      a.login = params[:login]
      a.email = params[:email]
      a.new_password = params[:password]
      if a.save
        redirect_to "/"
      else
        flash[:notice] = "Somewthing went wrong."
      end
    end
  end

  def login
    if request.post?
      user = User.authenticate(params[:login], params[:password])
      if user
        reset_session
        session[:user_id] = user.id
        redirect_to "/"
      else
        redirect_to root_path, :flash => { :notice => "Invalid email or password" }
      end
    else
      render :inline => ':('
    end
  end

  def logout
  	reset_session
  	redirect_to "/"
  end
end
