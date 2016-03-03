class AddColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :booking_id, :integer
  end
end
