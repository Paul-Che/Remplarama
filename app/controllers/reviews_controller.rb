class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @user = User.find(params[:user_id])

    authorize @review
  end

  def create
    @user = User.find(params[:user_id])
    @rating = params[:rating]
    @content = params[:content]

    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    @review.save
    flash[:notice] = "Votre avis a été créé. Merci."
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end

end
