class ChangeAvatarDefaultFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :avatar, :string, default: nil
  end
end
