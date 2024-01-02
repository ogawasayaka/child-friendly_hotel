require 'csv'

namespace :import do
  desc "Import hotels from csv"

  task hotels: :environment do
    path = File.join Rails.root, "db/csv/result.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          title: row[1],
          title_url: row[2],
          text: row[3]
      }
    end
    puts "start to create hotels data"
    begin
      Hotel.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end
