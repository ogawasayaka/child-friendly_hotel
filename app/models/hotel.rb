class Hotel < ApplicationRecord
  has_many :reviews
  has_one :prefecture
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name name_url prefecture_id updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[prefecture reviews]
  end
end
