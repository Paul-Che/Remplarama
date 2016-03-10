class ChangeToMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :booking_id, :integer

    add_reference :messages, :user, index: true
    add_reference :messages, :conversation, index: true

    add_column    :messages, :read_at, :timestamp
  end
end
