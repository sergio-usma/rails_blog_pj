class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    if @user
      @posts = @user.posts
      @user_name = @user.name
    else
      redirect_to users_path, alert: 'User not found.'
    end
  end

  def show
    @post = Post.find_by(id: params[:post_id])
    if @post
      @user = @post.author
    else
      redirect_to user_posts_path(params[:user_id]), alert: 'Post not found.'
    end
  end
end
