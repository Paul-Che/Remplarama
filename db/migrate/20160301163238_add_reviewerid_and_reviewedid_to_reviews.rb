class AddRevieweridAndReviewedidToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewer_id, :integer
    add_column :reviews, :reviewed_id, :integer
  end
end
