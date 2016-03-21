class AddCommissionToSlots < ActiveRecord::Migration
  def change
    add_column :slots, :commission, :integer
  end
end
