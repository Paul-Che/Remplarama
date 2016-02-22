class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :has_practice, :boolean
    add_column :users, :numero_ordre, :string
    add_column :users, :address, :string
    add_column :users, :speciality, :string
    add_column :users, :avatar, :string
    add_column :users, :numero_ursaff, :string
    add_column :users, :presentation, :text
    add_column :users, :education, :text
    add_column :users, :publications, :text
  end
end
