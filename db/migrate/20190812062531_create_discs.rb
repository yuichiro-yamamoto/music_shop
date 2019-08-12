class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.references :item, null: false, foreign_key: true

      t.integer :disc_number, null: false

      t.timestamps
    end
  end
end
