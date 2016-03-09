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
    authorize @slot
    @slot.destroy
    redirect_to calendar_path, notice: 'Le créneau a bien été détruit.'
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
