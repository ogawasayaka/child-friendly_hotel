class Review < ApplicationRecord
  belongs_to :hotel
  def self.ransackable_attributes(_auth_object = nil)
    %w[age created_at hotel_id id review review_time review_user updated_at url]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['hotel']
  end
end
