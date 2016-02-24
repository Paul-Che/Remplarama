class CalendarsController < ApplicationController

  def show
    @user = current_user
    authorize @user

    @slot_ranges = @user.slot_ranges
  end

  private

  def string_to_date(string)
    Time.parse(string).to_date
  rescue ArgumentError
    # we return nil
  end
end

