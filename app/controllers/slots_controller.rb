class SlotsController < ApplicationController

  def create
    # authorize @slot
    start_date = string_to_date(params[:start_date])
    end_date = string_to_date(params[:end_date])

    if start_date.nil? || end_date.nil?
      render :back
    end

    (start_date..end_date).to_a.each do |date|
      current_user.slots.new(date)
    end
    redirect_to current_user_path

    # @slot = current_user.slots.new(slot_params)

    # if @slot.save
    #   redirect_to current_user_path
    # end
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

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError
    # we return nil
  end
end
