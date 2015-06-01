class FriendshipController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user

  end
  def create
    @friendship = current_user.friendship.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendship.build(:friend_id => params[:friend_id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to root_url
  end
end


