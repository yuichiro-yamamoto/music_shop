class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.references :disc, null: false, foreign_key: true

      t.string :music_name, null: false
      t.integer :music_order, null: false

      t.timestamps
    end
  end
end
