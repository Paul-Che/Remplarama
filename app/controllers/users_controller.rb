class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  after_action :verify_authorized, only: :update

  def search
    @user = current_user
    @speciality = params[:speciality] || ['Médecine générale', 'Kinésithérapie', 'Autre spécialité']
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @has_practice = to_b(params[:has_practice])
    @commission = params[:commission] || "0 - 100%"
    @rating = params[:rating] || "0 - 5"
    @unrated = to_b(params[:unrated]) || false

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

    prefiltered_users = search_by_filters(located_users, @speciality, @has_practice, @commission, @rating, @unrated, @convention, @housing, @secretary, @house_visits)

    @users = search_by_date(prefiltered_users)

    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.picture({'url' => view_context.image_path('marker_yellow_small.png'), 'width' => 60, 'height' => 90, 'anchor' => [30, 90]})
      marker.infowindow "Dr. #{user.first_name} #{user.last_name}<br/>#{user.address}"
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

    @slots = current_user.slots
    @bookings = current_user.bookings
    authorize @user
  end

  def edit
    set_user
  end

  def update
    authorize @user, :update?
    set_user
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def to_b(string)
    if string == "true" || string == true
      true
    elsif string == nil
      nil
    else
      false
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def search_by_date(prefiltered_users)
    return prefiltered_users if @end_date == "" || @end_date.nil?
    @start_date = Date.today.to_s if @start_date == "" || @start_date.nil?
    users = []
    prefiltered_users.each do |user|
      user.slots.each do |slot|
        if slot.day >= Date.parse(@start_date) && slot.day <= Date.parse(@end_date)
          users << user if !users.include?(user)
        end
      end
    end
    return users
  end

  def search_by_filters(located_users, speciality, has_practice, commission, rating, unrated, convention, housing, secretary, house_visits)
    min_commission = commission.scan(/\d+ /).join.gsub(" ","").to_i
    max_commission = commission.scan(/\d+%/).join.gsub("%","").to_i
    min_rating = rating.first.to_i
    max_rating = rating.last.to_i

    users = located_users.where(speciality: speciality,
                       has_practice: has_practice,
                       commission: min_commission..max_commission,
                       convention: convention,
                       housing: housing,
                       secretary: secretary,
                       house_visits: house_visits)
    results = users.select do |user|
      (user.reviews.average(:rating) <= max_rating && user.reviews.average(:rating) >= min_rating) || (user.reviews.empty? if unrated == true)
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
