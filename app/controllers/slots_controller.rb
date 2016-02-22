class SlotsController < ApplicationController

  def create
    @slot = current_user.slots.new(slot_params)
    authorize @slot
    if @slot.save
      redirect_to user_path(@user)
    end

  end

  def update
    set_slot
  end

  def destroy
    authorize @slot
    @slot.destroy

    redirect_to user_path(@user), notice: 'Le créneaux a bien été détruit.'
  end

  private

  def set_slot
    @slot = Slot.find(params[:id])
    authorize @slot
  end

end
