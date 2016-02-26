class MessagesController < ApplicationController

  def show
    @message = Message.find(booking_id)
  end

  def new
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
