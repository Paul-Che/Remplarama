class BookingsController < ApplicationController
  #skip_after_action :verify_policy_scoped, only: :index_accepted_bookings
  respond_to :html, :js, :pdf
  before_filter :show_sidebar, only: [:index_accepted_bookings, :index_finished_bookings]

  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
  end

  def show
    @booking = Booking.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test_wicked_pdf"
      end
    end
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @user = params[:user_id]
    @start_date = params[:start_date].to_i
    @end_date = params[:end_date].to_i
    @slot_id = params[:slot_id].to_i

    # Permet de marquer les slots correspondants aux booking avec l'id booking en question :
    if booking_exists
      redirect_to :back, alert: "Vous avez déjà effectué cette demande"
    else
      @booking.save
      redirect_to calendar_path(current_user)
      # Pusher.trigger("new-booking-notification", "new_booking_event", {:start_date => @booking.start_date, :end_date => @booking.end_date})
    end

    authorize @booking

  end

  def update
    set_booking
    @booking.update(booking_params)
    if booking_params["accepted"] == "true"
      @booking.slot.update(status: "confirmed")
    end
    redirect_to calendar_path
  end

  def destroy
    set_booking
    @booking.destroy
  end

  def index_accepted_bookings
    set_accepted_bookings
    @contract = Contract.new
    @booking = Booking.new
    authorize @booking
  end

  def index_finished_bookings
    set_finished_bookings
    @review = Review.new
    @booking = Booking.new
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
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :slot_id, :user_id, :accepted)
  end

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError, TypeError
    # we return nil
  end

  def to_b(string)
    if string == "true" || string == true
      true
    elsif string == "false" || string == false
      false
    elsif string == nil
      nil
    else
      string
    end
  end

  def booking_exists
    check_bookings = @booking.user.bookings.map {|booking| (@booking.slot.user == booking.slot.user) && (@booking.start_date == booking.start_date) && (@booking.end_date == booking.end_date)}
    check_bookings.include? true
  end

  def set_accepted_bookings
    sent_accepted_bookings = Booking.where(accepted: true, user: current_user).where('end_date >= ?', Date.today)
    received_accepted_slots = Slot.where(status: "accepted", user: current_user).where('end_date >= ?', Date.today)
    received_accepted_bookings = []
    received_accepted_bookings = received_accepted_slots.bookings.where(accepted: true) unless received_accepted_slots.size == 0
    @accepted_bookings = sent_accepted_bookings.to_a + received_accepted_bookings.to_a
  end

  def set_finished_bookings
    sent_finished_bookings = Booking.where(accepted: true, user: current_user).where('end_date < ?', Date.today)
    received_finished_slots = Slot.where(status: "accepted", user: current_user).where('end_date < ?', Date.today)
    received_finished_bookings = []
    received_finished_bookings = received_finished_slots.bookings.where(accepted: true) unless received_finished_slots.size == 0
    @finished_bookings = sent_finished_bookings.to_a + received_finished_bookings.to_a
  end

end
