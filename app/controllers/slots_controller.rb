class SlotsController < ApplicationController

  def create
    @slot = current_user.slots.new(slot_params)

    if @slot.save
      redirect_to user_path(@user)
    end

  end

  def update
    authorize @slot
  end

  def destroy
    authorize @slot
  end

  private

  def set_slot
    @slot = Slot.find(params[:id])
    authorize @slot
  end

end
