class DeleteUseridFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :user_id
  end
end
