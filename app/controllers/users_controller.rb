class UsersController < ApplicationController

  def index
    @users = User.all
    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
  end

  def show

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :presentation, :photo)
  end

end
