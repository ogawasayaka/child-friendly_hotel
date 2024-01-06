require 'csv'

namespace :import do
  desc "Import reviews from csv"

  task reviews: :environment do
    path = File.join Rails.root, "db/csv/review_table.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          review_user: row['review_user'],
          review_time: row['review_time'],
          review: row['review'],
          url: row['url'],
          age: row['age'],
          hotel_id: row['hotel_id']
      }
    end
    puts "start to create reviews data"
    begin
      Review.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end
