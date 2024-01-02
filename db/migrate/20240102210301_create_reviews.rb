class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :hotel_id
      t.string :review_user
      t.time :review_time
      t.text :review
      t.string :url
      t.integer :age

      t.timestamps
    end
  end
end
