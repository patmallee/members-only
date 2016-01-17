class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def new
  end

  def create
  end

  def index
  end
  
  private
  
    def logged_in_user
      unless current_user != nil
        flash[:alert] = "You do not have the rights to access that page"
        redirect_to root_path
      end
    end
    
end
