class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def search
    @user = current_user
    @users = User.near(params[:location], 15)
    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
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

  def set_user
    @user = User.find(params[:id])

  end

  def user_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:user).permit(:first_name, :last_name, :address, :speciality, :numero_ordre,
     :numero_ursaff, :has_practice, :avatar, :presentation, :education, :publications)
  end

end
