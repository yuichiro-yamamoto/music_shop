# frozen_string_literal: true

class DeviseCreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false

      t.string :last_name, null: false, index: true
      t.string :first_name, null: false, index: true
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false

      t.boolean :delete_flag, null: false

      #enum
      t.integer :usually_payment, null: false, default: 0

      t.timestamps null: false
    end

    add_index :end_users, :email, unique: true
  end
end
