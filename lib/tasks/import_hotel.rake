require 'csv'

namespace :import_hotel do
  desc 'Import hotels from csv'

  task hotels: :environment do
    path = File.join Rails.root, 'db/csv/hotel_table.csv'
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        name: row['name'],
        prefecture_id: row['prefecture_id'],
        name_url: row['name_url']
      }
    end
    puts 'start to create hotels data'
    begin
      Hotel.create!(list)
      puts 'completed!!'
    rescue ActiveModel::UnknownAttributeError
      puts 'raised error : unKnown attribute '
    end
  end
end
