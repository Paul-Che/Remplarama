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
    if slot_save
      respond_to do |format|
        format.html { redirect_to calendar_path }
        format.js  # <-- will render `app/views/slots/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'calendars/show' }
        format.js
      end
    end
    authorize @slot
  end

  def show
    @slot = Slot.find(params[:id])
  end

  def destroy
    set_slot
    @slot.destroy
  end

  private

  def slots_params
    params.permit(:start_date, :end_date, :status, :user_id)
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


  def check_overlap
    check = @slot.user.slots.map {|slot| (slot.start_date > @end_date) || (slot.end_date < @start_date) }
    check.include? false
  end

  def slot_save
    if check_overlap
      redirect_to calendar_path, alert: 'Deux plages ne peuvent pas se chevaucher'
    else
      @slot.save
    end
  end
end
