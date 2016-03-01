class CalendarsController < ApplicationController

  def show
    @user = current_user
    authorize @user

    @slot_ranges = @user.slot_ranges

    @slotted_bookings = Booking.joins(:slots).where(slots: { user_id: current_user.id } ).distinct

  end

  private

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError
    # we return nil
  end
end

