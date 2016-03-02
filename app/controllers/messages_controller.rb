class MessagesController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: [:new, :create]
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @bookings = current_user.bookings
    # @messages = Message.all
    # booking_id = Message.find(1).booking_id
    # slot_id_user = Slot.where({ booking_id: booking_id }).first.user_id
    # @user_receiver = User.where({ id => slot_id_user })
  end

  def new

  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
