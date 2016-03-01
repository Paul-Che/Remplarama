class ReviewsController < ApplicationController
    # skip_before_action :verify_authorized, only: :create, :new
    # skip_before_action :verify_policy_scoped, only: :create, :new

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
    flash[:notice] = "Votre avis a été envoyé, merci."
    redirect_to user_path(@review.user)

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
