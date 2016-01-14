class UsersController < ApplicationController
  before_create :create_remember_token
  
  
  def new
  end
  
  def create
    
  end
  
  private
  
  def create_remember_token
    token = SecureRandom.urlsafe_base64.to_s
    Digest::SHA1.hexdigest(token)
    @user[:remember_token] = token
  end
  
end
