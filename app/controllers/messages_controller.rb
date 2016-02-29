class MessagesController < ApplicationController
  skip_after_action :verify_authorized, only: :new
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @bookings = current_user.bookings
    # @messages = Message.all
    # booking_id = Message.find(1).booking_id
    # slot_id_user = Slot.where({ booking_id: booking_id }).first.user_id
    # @user_receiver = User.where({ id => slot_id_user })
  end

  def new
    # authorize @message
    @message = Message.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @slot = Slot.where({ booking_id: ??}).first(:user_id)
    @user_sender = @booking.user # current_user ou @booking.user_id ???
    @user_receiver = @slot.user # slot.user_id ??
    @message = Message.new(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
