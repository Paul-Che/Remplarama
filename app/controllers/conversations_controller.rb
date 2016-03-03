class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]
  # transitoire
  skip_after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: [:show, :index]

   def show
    @box = params[:box]

    if @box == "sentbox"
      @conversations = @mailbox.sentbox.paginate(page: params[:page], per_page: 10)
    else
      @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
    end

    respond_to do |format|
      format.html
      format.js
    end
   end

  def index
    @box = params[:box]

    if @box == "sentbox"
      @conversations = @mailbox.sentbox.paginate(page: params[:page], per_page: 10)
    else
      @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end


