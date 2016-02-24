class SlotsController < ApplicationController
  skip_after_action :authenticate_user!, only: :create
  skip_after_action :authenticate_user!, only: :update
  skip_after_action :authenticate_user!, only: :destroy

  def create

    @start_date = string_to_date(params[:start_date])
    @end_date = string_to_date(params[:end_date])

    if @start_date.nil? || @end_date.nil?
      render :back
    end

    (@start_date..@end_date).to_a.each do |date|
    @slot = current_user.slots.new
    @slot.day = date
    @slot.status = "pending"
    # @slot.user = current_user
    @slot.save

    end
    redirect_to current_user
    # flash[:notice] = "Vos dates sont ajoutées à votre calendrier"
    authorize @slot
  end


  def update
    # @slots = Slot.find(params[:id)
    # @slots.update(slots_params)
    # @slots.save
  end

  def destroy
    authorize @slot
    @slot.destroy

    redirect_to user_path(@user), notice: 'Le créneaux a bien été détruit.'
  end

  private

  def slots_params
    params.require(:slot).permit(:day, :status, :user_id)
  end

  def set_slot
    @slot = Slot.find(params[:id])
    authorize @slot
  end

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError
    # we return nil
  end
end
