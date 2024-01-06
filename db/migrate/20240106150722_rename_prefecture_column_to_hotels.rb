class RenamePrefectureColumnToHotels < ActiveRecord::Migration[7.0]
  def change
    rename_column :hotels, :prefecture, :prefecture_id
  end
end
