class SlotRangesController < ApplicationController
  skip_after_action :verify_authorized

  def destroy
    start_date, end_date = params[:id].split('--')
    slots = current_user.slots.in_range(start_date, end_date)
    slots.destroy_all

    redirect_to calendar_path
  end
end
