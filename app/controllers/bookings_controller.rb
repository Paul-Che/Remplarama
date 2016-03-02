class BookingsController < ApplicationController
  # skip_after_action :verify_policy_scoped, only: :index

  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @user = params[:user_id]
    @start_date = params[:start_date].to_i
    @end_date = params[:end_date].to_i
    @slot_id = params[:slot_id].to_i

    # Permet de marquer les slots correspondants aux booking avec l'id booking en question :
    @booking.save


    authorize @booking

    redirect_to calendar_path(current_user)


    # if date_check_included?
    #   flash[:notice] = "Votre demande a été envoyée"
    #   redirect_to calendar_path
    # else
    #   flash[:alert] = "Les dates ne correspondent pas ! Veuillez tenter à nouveau"
    #   redirect_to user_path(@user, start_date: @start_date, end_date: @end_date)
    # end
  end

  def confirm
    set_booking
    authorize @booking
    @booking.slots.each do |slot|
      slot.status = "confirmed"
      slot.save
    end
    redirect_to :back
  end

  def reject
    set_booking
    authorize @booking
    @booking.slots.each do |slot|
      slot.status = "rejected"
      slot.save
    end
    redirect_to :back
  end

  def update

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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.permit(:start_date, :end_date, :slot_id, :user_id)
  end

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError, TypeError
    # we return nil
  end
end
