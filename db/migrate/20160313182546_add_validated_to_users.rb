class AddValidatedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :validated, :string
  end
end
