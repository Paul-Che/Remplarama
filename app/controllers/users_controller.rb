class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def search
    @user = current_user
    @speciality = params[:speciality] || ['Médecine générale', 'Kinésithérapie', 'Autre spécialité']
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @has_practice = to_b(params[:has_practice])
    @commission = params[:commission] || "0 - 100%"
    @rating = params[:rating] || "0 - 5"
    @unrated = to_b(params[:unrated]) || false
    @convention = params[:convention] || ['Conventionné secteur 1', 'Conventionné secteur 2', 'Non conventionné']
    @housing = to_b(params[:housing]) || false
    @secretary = to_b(params[:secretary]) || false
    @house_visits = params[:house_visits] || ['Aucune', '<= 2 / jour', '> 2 / jour']

    @location = params[:location]
    located_users = User.near(@location, 15)

    @users = search_by_filters(located_users, @speciality, @has_practice, @commission, @rating, @unrated, @convention, @housing, @secretary, @house_visits)

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
    @slots = current_user.slots
    @bookings = current_user.bookings
    authorize @user
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def to_b(string)
    if string == "true" || string = true
      true
    else
      false
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def search_by_date
  end

  def search_by_filters(located_users, speciality, has_practice, commission, rating, unrated, convention, housing, secretary, house_visits)
    min_commission = commission.scan(/\d+ /).join.gsub(" ","").to_i
    max_commission = commission.scan(/\d+%/).join.gsub("%","").to_i
    min_rating = rating.first.to_i
    max_rating = rating.last.to_i
    #binding.pry
    users = located_users.where(speciality: speciality,
                       has_practice: has_practice)
                       # commission: min_commission..max_commission,
                       # convention: convention,
                       # housing: housing,
                       # secretary: secretary,
                       # house_visits: house_visits)

    results = users.select do |user|
      (user.reviews.average(:rating) <= max_rating && user.reviews.average(:rating) >= min_rating) || user.reviews.empty? if unrated == true
    end
    return results
  end

  def user_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:user).permit(:first_name, :last_name, :address, :speciality, :numero_ordre,
     :numero_ursaff, :has_practice, :avatar, :presentation, :education, :publications)
  end

end
