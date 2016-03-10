class MessagesController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: [:new, :create]
  skip_after_action :verify_policy_scoped, only: :index

  def create
    @selected_conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation = @selected_conversation
    @message.save
    @conversations = current_user.conversations
  end

  def new
    @user = User.find(params[:format])
    @new_conversation = Conversation.new(user1: current_user,user2: @user)
    @new_conversation.save
    flash[:user2] = @user
  end

  def create_new
    # binding.pry
    @new_conversation = Conversation.new(user1: current_user,user2: flash[:user2])
    @new_conversation.save
    raise
    @new_message = Message.new(user: current_user, conversation: @new_conversation, content: params[:message][:content])
    @new_message.save
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end

