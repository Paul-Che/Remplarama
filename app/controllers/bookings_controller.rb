class BookingsController < ApplicationController

  def create
    authorize @booking
  end

  def update
    authorize @booking
  end

  def destroy
    authorize @booking
  end

end
