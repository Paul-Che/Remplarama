class UsersController < ApplicationController

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
    @user = User.find(params[:id])
    @slots = current_user.slots
    @bookings = current_user.bookings
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :presentation, :photo)
  end

end
