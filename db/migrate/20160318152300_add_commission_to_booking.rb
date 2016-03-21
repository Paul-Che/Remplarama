class AddCommissionToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :commission, :integer
  end
end
