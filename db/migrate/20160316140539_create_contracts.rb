class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :type
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
