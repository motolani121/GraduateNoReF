class UserHomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
    @friend = User.all
    @friendship = current_user.friendship.all
    @posts = Post.all
  end
  def show
    @users = User.all

    @posts = Post.where(:user_id => current_user)

  end

end
