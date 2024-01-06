class ChangeDatatypePrefectureIdOfHotels < ActiveRecord::Migration[7.0]
  def change
    change_column :hotels, :prefecture_id, :bigint, using: 'prefecture_id::bigint'
  end
end
