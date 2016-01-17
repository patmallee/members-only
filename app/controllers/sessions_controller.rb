require 'sessions_helper'

class SessionsController < ApplicationController
    
  def new
  end
    
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login successful!"
      log_in(user)
      set_remember_token(user)
      redirect_to user_path(user.id)
    else
      render 'new'
    end
  end
    
  def destroy
    log_out
    redirect_to root_path
  end
    
end
