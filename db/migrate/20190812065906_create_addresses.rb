class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :end_user, null: false, foreign_key: true

      t.string :address, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :telephone_number, null: false

      t.boolean :main_flag, null: false

      t.timestamps
    end
  end
end
