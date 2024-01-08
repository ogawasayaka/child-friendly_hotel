class Hotel < ApplicationRecord
  has_many :reviews
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "name_url", "prefecture_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["prefecture"]
  end
end
