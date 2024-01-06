class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :review_user
      t.timestamp :review_time
      t.text :review
      t.text :url
      t.integer :age
      t.integer :hotel_id

      t.timestamps
    end
  end
end
