class RemoveDayFromSlot < ActiveRecord::Migration
  def change
    remove_column :slots, :day
  end
end
