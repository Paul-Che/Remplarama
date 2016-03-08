class ChangeToConversations < ActiveRecord::Migration
  def change
    rename_column :conversations, :user_id, :user1_id
    add_column :conversations, :user2_id, :integer
  end
end
