class UsersController < ApplicationController

  def search
    @user = current_user
    # if params[:profil] == "remplaçant"
    #   @user.has_practice = true
    # else
    #   @user.has_practice = false
    # end
    @users = User.near(params[:location], 15)
    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.json({ :id => user.id })
    end
    authorize @user
  end

  def show
    @user = User.find(params[:id])
    @slots = current_user.slots
    @bookings = current_user.bookings
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :presentation, :photo)
  end

end
