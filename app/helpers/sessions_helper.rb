module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def logged_in?
    session[:user_id] ? true : false
  end
  
  def set_remember_token(user)
    token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
    user.update_attributes(remember_token: token)
    cookies.permanent[:remember_token] = token
  end
  
  def current_user
    @current_user ||= User.find_by(remember_token: cookies.permanent[:remember_token])
  end
  
  def log_out
    if logged_in?
      @current_user = nil
      session[:user_id] = nil
      cookies.permanent[:remember_token] = nil
      flash[:alert] = "Log out successful"
    end
  end
  
end
