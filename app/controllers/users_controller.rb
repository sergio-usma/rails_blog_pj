class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:user_id])
    if @user
      @posts = @user.posts
    else
      redirect_to users_path, alert: "User not found."
    end
  end
end
