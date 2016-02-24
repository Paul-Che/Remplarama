class BookingsController < ApplicationController


  def new
    @booking = Booking.new

  end

  def create
    @booking = Booking.new(booking_params)

  end

  def update
    authorize @booking
  end

  def destroy
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
