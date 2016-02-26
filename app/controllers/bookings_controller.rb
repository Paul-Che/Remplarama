class BookingsController < ApplicationController


  def new
    @booking = Booking.new
  end

  def create
    authorize @booking
    @user = User.find(params[:user_id])
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if  date_check_included == true
      @booking.save
      flash[:notice] = "Votre demande a été envoyée"
      redirect_to calendar_path
    else
      flash[:alert] = "Les dates ne correspondent pas ! Veuillez tenter à nouveau"
      render :back
    end
  end


  def update
    authorize @booking
    set_booking
    if params[:commit] == "Confirm"
      @booking.status = "confirmed"
    elsif params[:commit] == "Reject"
      @booking.status = "rejected"
    end
    @booking.save
    redirect_to :back
  end

  def destroy
    authorize @booking
  end

  private

  def date_check_included
    # chaque jour entre start_date et end_date doit etre un slot == "pending" du @user
    pending_slots_days = []
    @user.slots.each do |slot|
      pending_slots_days << slot.day if slot.status == "pending"
    end
    (@start_date..@end_date).map{|d| d }.each do |day|
      return false if !pending_slots_days.include?(day)
    end
    return true
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
