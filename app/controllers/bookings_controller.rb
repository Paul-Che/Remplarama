class BookingsController < ApplicationController


  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.user = current_user

    if date_check_included?
      @booking.save
      flash[:notice] = "Votre demande a été envoyée"
      redirect_to calendar_path
    else
      flash[:alert] = "Les dates ne correspondent pas ! Veuillez tenter à nouveau"
      redirect_to user_path(@user, start_date: @start_date, end_date: @end_date)
    end
  end

  def update
    authorize @booking
    @booking = Booking.find(params[:id])
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

  def date_check_included?
    # chaque jour entre start_date et end_date doit etre un slot == "pending" du @user
    pending_slots_days = @user.slots.where(status: "pending").pluck(:day)

    (string_to_date(@start_date)..string_to_date(@end_date)).each do |day|
      return false unless pending_slots_days.include?(day)
    end

    return true
  end

  def booking_params
    params.permit(:start_date, :end_date)
  end

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError, TypeError
    # we return nil
  end
end
