class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_conversation, except: [:index]
  # transitoire
  skip_after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: [:show, :index]

  def index
    @conversations = current_user.conversations
    if params[:conversation_id]
      @selected_conversation = @conversations.find(params[:conversation_id])
    else
      @selected_conversation = @conversations.first
    end
    @unread_messages = @selected_conversation.unread_messages(current_user)
    @unread_messages.each { |message| message.mark_as_read }
    @unread_conversations_count = current_user.unread_conversations_count
  end

end

  #  def show
  #   @box = params[:box]

  #   if @box == "sentbox"
  #     @conversations = @mailbox.sentbox.paginate(page: params[:page], per_page: 10)
  #   else
  #     @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  #   end

  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  #  end

  # def index
  #   @box = params[:box]

  #   if @box == "sentbox"
  #     @conversations = @mailbox.sentbox.paginate(page: params[:page], per_page: 10)
  #   else
  #     @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  #   end

  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end

  # private

  # def get_mailbox
  #   @mailbox ||= current_user.mailbox
  # end

  # def get_conversation
  #   @conversation ||= @mailbox.conversations.find(params[:id])
  # end

