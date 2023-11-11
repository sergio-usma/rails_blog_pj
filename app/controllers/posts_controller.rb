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
      redirect_to users_path, alert: 'Post not found.'
    end
  end

  def new
    @post = Post.new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = params[:user_id]
    if @post.save
      redirect_to user_post_path(@post.author, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
