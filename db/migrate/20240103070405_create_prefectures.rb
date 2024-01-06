class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.references :region, null: false, foreign_key: true
      t.string :name
      t.string :name_en
      t.integer :sort

      t.timestamps
    end
  end
end
