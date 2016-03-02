class DropTableBookedslot < ActiveRecord::Migration
  def change
    drop_table :bookedslots
  end
end
