class SessionsController < ApplicationController
    
    def new
    end
    
    def create
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        flash[:success] = "Login successful!"
        log_in(user)
        set_remember_token
        current_user
      else
        redirect_to root_url
      end
    end
    
end
