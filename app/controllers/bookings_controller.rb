class BookingsController < ApplicationController


  def new

  end

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
