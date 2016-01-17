class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id] = @current_user
    if @post.save
      flash[:success] = "Post successful!"
      redirect_to posts_path
    end
  end

  def index
  end
  
  private
  
    def post_params
      params.require(:post).permi(:content)
    end
  
    def logged_in_user
      unless current_user != nil
        flash[:alert] = "You do not have the rights to access that page"
        redirect_to root_path
      end
    end
    
end
