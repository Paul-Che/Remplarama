class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :presentation, :photo)
  end

end
