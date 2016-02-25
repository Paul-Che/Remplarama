class AddConventionToUser < ActiveRecord::Migration
  def change
    add_column :users, :convention, :string
  end
end
