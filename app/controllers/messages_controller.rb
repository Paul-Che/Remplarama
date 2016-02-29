class MessagesController < ApplicationController
  skip_after_action :verify_authorized, only: :new
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @messages = Message.all
  end

  def new
    # authorize @message
    @message = Message.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @slot = Slot.find(params[:slot_id]) # ????
    @user_sender = @booking.user # current_user ou @booking.user_id ???
    @user_receiver = @slot.user # slot.user_id ??
    @message = Message.new(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
