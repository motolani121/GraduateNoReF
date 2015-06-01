class MessagesController < ApplicationController
  before_filter :authenticate_user!
  # GET /messages/new
  def new
    #@users = User.find(params[:users])
    @messages = current_user.messages.new
  end

  # POST /messages/create
  def create
    @users = User.find_by_email(params[:user])

    current_user.send_message(@users,params[:body], params[:subject])
    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end


end
