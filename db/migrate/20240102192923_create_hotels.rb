class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.integer :hotel_id
      t.string :name
      t.string :prefecture
      t.string :name_url
      t.integer :age

      t.timestamps
    end
  end
end
