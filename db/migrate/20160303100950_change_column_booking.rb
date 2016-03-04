class ChangeColumnBooking < ActiveRecord::Migration
  def change
    change_column :bookings, :accepted, :boolean, default: nil
  end
end
