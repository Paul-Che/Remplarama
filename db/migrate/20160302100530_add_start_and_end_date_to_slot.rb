class AddStartAndEndDateToSlot < ActiveRecord::Migration
  def change
    add_column :slots, :start_slot, :date
    add_column :slots, :end_slot, :date
  end
end
