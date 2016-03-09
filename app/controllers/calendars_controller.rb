class CalendarsController < ApplicationController
  before_filter :disable_footer, only: [:show,]

  def show
    @user = current_user
    @review = Review.new
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

