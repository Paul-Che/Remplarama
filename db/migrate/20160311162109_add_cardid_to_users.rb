class AddCardidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :card_id, :string
  end
end
