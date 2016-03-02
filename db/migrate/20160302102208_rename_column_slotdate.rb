class RenameColumnSlotdate < ActiveRecord::Migration
  def change
    rename_column :slots, :start_slot, :start_date
    rename_column :slots, :end_slot, :end_date
  end
end
