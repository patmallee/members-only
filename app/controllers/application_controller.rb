class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def set_remember_token(user)
    token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
    user.update_attributes(remember_token: token)
    cookies.permanent[:remember_token] = token
  end
  
  def current_user
    @current_user ||= User.find_by(remember_token: cookies.permanent[:remember_token])
  end
  
  def current_user=(user)
    @current_user = user
  end
  
end
