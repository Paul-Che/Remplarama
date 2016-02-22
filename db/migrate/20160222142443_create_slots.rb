class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.date :day
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
