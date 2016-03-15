class ChangeColumnDefaultToUsers < ActiveRecord::Migration
  def change
    change_column :users, :house_visits_tolerance, :string, default: "above2"
    change_column :users, :nosecretary_tolerance, :boolean, default: true
    change_column :users, :nohousing_tolerance, :boolean, default: true
    change_column :users, :min_commission, :integer, default: 0
  end
end
