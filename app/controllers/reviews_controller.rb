class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @user = User.find(params[:user_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.reviewed_id = params[:user_id].to_i

    @rating = params[:rating]
    @content = params[:content]
    @review.reviewer_id = current_user.id

    authorize @review
    @review.save

    redirect_to finished_bookings_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :reviewer_id, :reviewed_id, :booking_id)
  end

end
