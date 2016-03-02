class SlotsController < ApplicationController
  skip_after_action :authenticate_user!, only: :create
  skip_after_action :authenticate_user!, only: :update
  skip_after_action :authenticate_user!, only: :destroy

  def create

    @slot = Slot.new(slots_params)
    @start_date = string_to_date(params[:start_date])
    @end_date = string_to_date(params[:end_date])

    @slot.status = "pending"
    if @start_date.nil? || @end_date.nil?
      render :back
    end

    # (@start_date..@end_date).to_a.each do |date|
    #   @slot = current_user.slots.new
    #   @slot.day = date
    #   @slot.status = "pending"
    #   # @slot.user = current_user
    #   @slot.save
    # end


    @slot.save

    redirect_to calendar_path
    # flash[:notice] = "Vos dates sont ajoutées à votre calendrier"
    authorize @slot
  end


  def update
    # @slots = Slot.find(params[:id)
    # @slots.update(slots_params)
    # @slots.save
  end

  def destroy
    set_slot
    @slot.destroy

    redirect_to :back, notice: 'Le créneaux a bien été détruit.'
  end

  private

  def slots_params
    params.permit(:start_date, :end_date, :status, :user_id,)
  end

  def set_slot
    @slot = Slot.find(params[:id])
    authorize @slot
  end

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError, TypeError
    # we return nil
  end
end
