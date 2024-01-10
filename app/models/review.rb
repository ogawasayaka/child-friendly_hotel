class Review < ApplicationRecord
  belongs_to :hotel
  def self.ransackable_attributes(auth_object = nil)
    ["age", "created_at", "hotel_id", "id", "review", "review_time", "review_user", "updated_at", "url"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["hotel"]
  end
    
end
