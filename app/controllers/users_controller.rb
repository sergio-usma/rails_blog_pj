class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    case params[:id]
    when 'sign_out'
      sign_out current_user
      redirect_to root_path
    when 'sign_in'
      redirect_to new_user_session_path
    when 'sign_up'
      redirect_to new_user_registration_path
    else
      @user = User.find(params[:id])
      @posts = @user.posts
    end
  end
end
