class ConversationsController < ApplicationController

  before_filter :authenticate_user!
  helper_method :mailbox, :conversation
  def index
    @conversations ||= current_user.mailbox.inbox.all
  end
  def new
    @messages = current_user.messages.new
  end
  def create
    @users = User.find_by_email(params[:email])

    current_user.send_message(@users,[:email],params[:body])

    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end

  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation
  end

  def trashbin
    @trash ||= current_user.mailbox.trash.all
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :back
  end

  def empty_trash
    current_user.mailbox.trash.each do |conversation|
      conversation.receipts_for(current_user).update_all(:deleted => true)
    end
    redirect_to :conversations
  end



  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation

    @conversations ||= conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversations, *keys)

  end

  def message_params(*keys)
    fetch_params(:messages, *keys)
  end

  def fetch_params(key, *subkeys)
        params[key].instance_eval do
          case subkeys.size
            when 0 then self
            when 1 then self[subkeys.first]
            else subkeys.map{|k| self[k] }
          end
    end
  end
end
