FactoryBot.define do
  factory :review do
    hotel_id { 1 }
    review_user { "MyString" }
    review_time { "2024-01-03 06:03:01" }
    review { "MyText" }
    url { "MyString" }
    age { 1 }
  end
end
