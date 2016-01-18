class User < ActiveRecord::Base
  before_create :create_remember_token
  
  has_many :posts
    
    has_secure_password
    
    
  private
  
  def create_remember_token
    token = SecureRandom.urlsafe_base64.to_s
    token = Digest::SHA1.hexdigest(token)
    self.remember_token = token
  end
    
end
