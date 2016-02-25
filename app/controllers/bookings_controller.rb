class BookingsController < ApplicationController


  def new
    @booking = Booking.new
  end

  def create
    @slot = Slot.find(params[:slot_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if  date_check_included == true
      @booking.save
      redirect_to calendar_path
    else
      render :back
    end
  end

  def update
    authorize @booking
  end

  def destroy
    authorize @booking
  end

  private

  def date_check_included
    # je recupère tous les slots range d'un requested user
    # slots.range.include?(booking.start_date) && slots.range.include?(booking.start_date)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
