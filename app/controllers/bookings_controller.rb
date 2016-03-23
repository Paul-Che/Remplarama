class BookingsController < ApplicationController
  #skip_after_action :verify_policy_scoped, only: :index_accepted_bookings
  respond_to :html, :js, :pdf
  before_filter :show_sidebar, only: [:index_accepted_bookings, :index_finished_bookings, :index_sent_requests, :index_received_requests]

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
    elsif @booking.save == false
      redirect_to user_path(@user), alert: "Merci d'indiquer le reversement proposé au remplaçant"
    else
      redirect_to sent_requests_path
      # Pusher.trigger("new-booking-notification", "new_booking_event", {:start_date => @booking.start_date, :end_date => @booking.end_date})
    end

    authorize @booking

  end

  def update
    set_booking
    if booking_params["accepted"] == "true"
      @booking.slot.update(status: "confirmed")
      Booking.where(slot: @booking.slot).update_all(accepted: false)
      @booking.update(booking_params)
    end
    redirect_to received_requests_path
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

  def index_sent_requests
    @booking = Booking.new
    @sent_booking_requests = current_user.bookings
    authorize @booking
  end

  def index_received_requests
    @booking = Booking.new
    @received_booking_requests = []
    current_user.slots.where('end_date > ?', Date.today).order(created_at: :desc).each do |slot|
      slot.bookings.where(accepted: nil).order(created_at: :asc).each do |booking|
        @received_booking_requests << booking
      end
    end
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
    params.require(:booking).permit(:start_date, :end_date, :slot_id, :user_id, :accepted, :commission)
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
    received_accepted_slots = Slot.where(status: "confirmed", user: current_user).where('end_date >= ?', Date.today)
    received_accepted_bookings = []
    received_accepted_slots.each do |slot|
      received_accepted_bookings << slot.bookings.where(accepted: true)
    end
    @accepted_bookings = sent_accepted_bookings.to_a + received_accepted_bookings.flatten
  end

  def set_finished_bookings
    sent_finished_bookings = Booking.where(accepted: true, user: current_user).where('end_date < ?', Date.today)
    received_finished_slots = Slot.where(status: "confirmed", user: current_user).where('end_date < ?', Date.today)
    received_finished_bookings = []
    received_finished_slots.each do |slot|
      received_finished_bookings << slot.bookings.where(accepted: true)
    end
    @finished_bookings = sent_finished_bookings.to_a + received_finished_bookings.flatten
  end

end
