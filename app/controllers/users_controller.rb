class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  after_action :verify_authorized, only: :update

  def search
    @user = current_user
    @location = params[:location]
    @users = User.near(@location, 15)
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
    authorize @user, :update?
    set_user
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])

  end

  def user_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:user).permit(:first_name, :last_name, :has_practice, :email, :password,
      :password_confirmation, :address, :speciality, :numero_ordre, :numero_ursaff, :avatar,
       :presentation, :education, :publications)
  end

end
