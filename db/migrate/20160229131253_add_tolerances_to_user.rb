class AddTolerancesToUser < ActiveRecord::Migration
  def change
    add_column :users, :house_visits_tolerance, :string
    add_column :users, :nosecretary_tolerance, :boolean
    add_column :users, :nohousing_tolerance, :boolean
    add_column :users, :min_commission, :integer
  end
end
