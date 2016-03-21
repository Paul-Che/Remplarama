class CalendarsController < ApplicationController

  def show
    @user = current_user
    @slot = Slot.new
    @review = Review.new
    @contract = Contract.new
    authorize @user
    @slotted_bookings = Booking.joins(:slots).where(slots: { user_id: current_user.id } ).distinct
  end

  private

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError
    # we return nil
  end
end

