class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :end_user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.string :review_title, null: false

      t.text :review_body, null: false

      t.timestamps
    end
  end
end
