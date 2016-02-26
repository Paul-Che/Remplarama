class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :commission, :integer
  end
end
