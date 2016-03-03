class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  after_action :verify_authorized, only: :update
  before_filter :disable_footer, only: [:search_practices, :search_locums, :show,]

  def search_practices
    @user = current_user
    @speciality = params[:speciality] || ['Médecine générale', 'Kinésithérapie', 'Autre spécialité']
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @has_practice = true

    @commission = params[:commission] || "0 - 100%"
    @min_commission = @commission.scan(/\d+ /).join.gsub(" ","").to_i
    @max_commission = @commission.scan(/\d+%/).join.gsub("%","").to_i

    @rating = params[:rating] || "0 - 5"
    @min_rating = @rating.first.to_i || 0
    @max_rating = @rating.last.to_i || 5

    @unrated = to_b(params[:unrated])

    if params[:convention] == 'all'
      @convention = ['1', '2', '3']
    else
      @convention = params[:convention] || ['1', '2', '3']
    end

    @housing = to_b(params[:housing]) || [true, false]
    @secretary = to_b(params[:secretary]) || [true, false]

    if params[:house_visits] == 'all'
      @house_visits = ['none', 'max2', 'above2']
    else
      @house_visits = params[:house_visits] || ['none', 'max2', 'above2']
    end
    @location = params[:location]
    if params[:location].nil? || params[:location] == ""
      located_users = User.all
    else
      located_users = User.near(@location, 15)
    end

    prefiltered_users = search_practice_by_filters(located_users, @speciality, @has_practice, @min_commission,
      @max_commission, @min_rating, @max_rating, @unrated, @convention, @housing, @secretary, @house_visits)

    @users = search_by_date(prefiltered_users)

    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.picture({'url' => view_context.image_path('marker_yellow_small.png'), 'width' => 60, 'height' => 90, 'anchor' => [15, 45]})
      marker.infowindow "<strong>Dr. #{user.first_name} #{user.last_name}</strong><br/>#{user.address}"
      marker.json({ :id => user.id })
    end
    authorize @user
  end

  def search_locums
    @user = current_user
    @speciality = params[:speciality] || ['Médecine générale', 'Kinésithérapie', 'Autre spécialité']
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @has_practice = false
    @min_commission = extract_percent_value(params[:min_commission], 75)

    @rating = params[:rating] || "0 - 5"
    @min_rating = @rating.first.to_i || 0
    @max_rating = @rating.last.to_i || 5

    @unrated = to_b(params[:unrated])

    @house_visits_tolerance = params[:house_visits_tolerance]
    @nosecretary_tolerance = params[:nosecretary_tolerance]
    @nohousing_tolerance = params[:nohousing_tolerance]

    @location = params[:location]
    if params[:location].nil? || params[:location] == ""
      located_users = User.all
    else
      located_users = User.near(@location, 15)
    end

    prefiltered_users = search_locum_by_filters(located_users, @speciality, @has_practice,
      @min_commission, @min_rating, @max_rating, @unrated, @nohousing_tolerance, @nosecretary_tolerance, @house_visits_tolerance)

    @users = search_by_date(prefiltered_users)

    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.picture({'url' => view_context.image_path('marker_yellow_small.png'), 'width' => 60, 'height' => 90, 'anchor' => [15, 45]})
      marker.infowindow "<strong>Dr. #{user.first_name} #{user.last_name}</strong><br/>#{user.address}"
      marker.json({ :id => user.id })
    end
    authorize @user
  end

  def show
    set_user

    @markers = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
   end
    p @markers


    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @bookings = current_user.bookings
    @slots = current_user.slots

    authorize @user
  end

  def profile
    @markers = Gmaps4rails.build_markers(current_user) do |user, marker|
       marker.lat user.latitude
       marker.lng user.longitude
       marker.picture({'url' => view_context.image_path('marker_yellow_small.png'), 'width' => 60, 'height' => 90, 'anchor' => [15, 45]})
    end

    # @slot_ranges = current_user.slot_ranges
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @booking = current_user.bookings
    @slots = current_user.slots

    authorize current_user
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    authorize @user
    redirect_to :back
  end

  private

  def extract_percent_values(string, default)
    return default if string.blank?
    string.scan(/\d+%/).join.gsub("%", "").to_i
  end

  def extract_percent_value(string, default)
    return default if string.blank?
    string.scan(/\d+%/).join.gsub("%", "").to_i
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

  def set_user
    @user = User.find(params[:id])
  end

  def search_by_date(prefiltered_users)
    return prefiltered_users if @end_date == "" || @end_date.nil?
    @start_date = Date.today.strftime("%d/%m/%Y") if @start_date == "" || @start_date.nil?
    users = []
    prefiltered_users.each do |user|
      user.slots.each do |slot|
        if slot.start_date <= Date.parse(@start_date) && slot.end_date >= Date.parse(@end_date)
          users << user if !users.include?(user)
        end
      end
    end
    return users
  end

  def search_practice_by_filters(located_users, speciality, has_practice, min_commission, max_commission, min_rating, max_rating, unrated, convention, housing, secretary, house_visits)
    users = located_users.where(speciality: speciality,
                       has_practice: has_practice,
                       commission: min_commission..max_commission,
                       convention: convention,
                       housing: housing,
                       secretary: secretary,
                       house_visits: house_visits)
    results = users.select do |user|
      if user.reviews_i_received.size > 0
        (user.reviews_i_received.average(:rating) <= max_rating && user.reviews_i_received.average(:rating) >= min_rating)
      else
        user if unrated == true
      end
    end
    return results
  end

  def search_locum_by_filters(located_users, speciality, has_practice, min_commission, min_rating, max_rating, unrated, nohousing_tolerance, nosecretary_tolerance, house_visits_tolerance)
    house_visits_tolerance = [nil, 'none', 'max2', 'above2'] if house_visits_tolerance == "all" || house_visits_tolerance.nil?
    nosecretary_tolerance = [nil, true, false] if nosecretary_tolerance == "all" || nosecretary_tolerance.nil?
    nohousing_tolerance = [nil, true, false] if nohousing_tolerance == "all" || nohousing_tolerance.nil?

    users = located_users.where(speciality: speciality,
                       has_practice: has_practice,
                       nohousing_tolerance: to_b(nohousing_tolerance),
                       nosecretary_tolerance: to_b(nosecretary_tolerance),
                       house_visits_tolerance: house_visits_tolerance).where("min_commission <= ?", min_commission + 5)

    results = users.select do |user|
      if user.reviews_i_received.size > 0
        (user.reviews_i_received.average(:rating) <= max_rating && user.reviews_i_received.average(:rating) >= min_rating)
      else
        user if unrated == true
      end
    end
    return results
  end

  def user_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:user).permit(:first_name, :last_name, :has_practice, :email, :password,
      :password_confirmation, :address, :speciality, :numero_ordre, :numero_ursaff, :avatar,
       :presentation, :education, :publications)
  end

end
