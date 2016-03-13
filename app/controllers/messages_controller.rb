class MessagesController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: [:new, :create, :create_new]
  skip_after_action :verify_policy_scoped, only: [:inde]

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
    flash[:user2] = @user
  end

  def create_new
    # binding.pry
    user_id = flash[:user2]["id"]
    user2 = User.find(user_id)
    @new_conversation = Conversation.new(user1: current_user,user2: user2)
    @new_conversation.save
    @new_message = Message.new(user: current_user, conversation: @new_conversation, content: params[:message][:content])

    @new_message.save
    redirect_to conversations_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end

