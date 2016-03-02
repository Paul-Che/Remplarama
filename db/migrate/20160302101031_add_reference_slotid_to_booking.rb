class AddReferenceSlotidToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :slot, index: true
  end
end
