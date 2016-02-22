class ReviewsController < ApplicationController

  def new
    authorize @slot
  end

  def create
    authorize @slot
  end

  def edit
    authorize @slot
  end

  def update
    authorize @slot
  end

  def destroy
    authorize @slot
  end

end
