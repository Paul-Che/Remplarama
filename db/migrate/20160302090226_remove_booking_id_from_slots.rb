class RemoveBookingIdFromSlots < ActiveRecord::Migration
  def change
    remove_column :slots, :booking_id
  end
end
