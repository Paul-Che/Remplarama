class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :housing, :boolean
    add_column :users, :secretary, :boolean
    add_column :users, :house_visits, :string
  end
end
