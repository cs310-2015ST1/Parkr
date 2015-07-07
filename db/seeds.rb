# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



require 'nokogiri'

file = File.open(File.expand_path('app/assets/sources/parking_meter_rates_and_time_limits.kml'))

#file = File.open(File.expand_path('app/assets/sources/pmtest.kml'))

data = Nokogiri::XML(file)

data.css("Placemark").each do |placeMark|

  pm = ParkingMeter.new

  if /\d+\:\d+[\w|\s]+\d+\:+\d+[\w|\s]+/.match(placeMark.at('description'))
    pm.in_effect = /\d+\:\d+[\w|\s]+\d+\:+\d+[\w|\s]+/.match(placeMark.at('description'))
  else
    puts "invalid in effect"
    exit 1
  end
  if /[0-9]+/.match(placeMark.at('name'))
    pm.name = /[0-9]+/.match(placeMark.at('name'))
  else
    puts "invalid name"
    exit 1
  end
  if /(Single|Twin)/.match(placeMark.at('description'))
    pm.head_type = /(Single|Twin)/.match(placeMark.at('description'))
  else
    puts "invalid type"
    exit 1
  end
  if /[0-9]\sHr/.match(placeMark.at('description'))
  pm.time_limit = /[0-9]\sHr/.match(placeMark.at('description'))
  else
    puts "invalid time limit"
    exit 1
  end
  if /(\$[0-9]*\.[0-9]*)/.match(placeMark.at('description'))
  pm.rate = /(\$[0-9]*\.[0-9]*)/.match(placeMark.at('description'))
  else
    puts "invalid rate"
    exit 1
  end
  if /[0-9]+/.match(placeMark.at('name'))
  pm.pay_by_phone = /[0-9]+/.match(placeMark.at('name'))
  else
    puts "invalid pay by phone"
    exit 1
  end
  if /(49\.\d+)/.match(placeMark.at('coordinates'))
  lat = /(49\.\d+)/.match(placeMark.at('coordinates'))
  else
    puts "invalid lat"
    exit 1
  end
  if /(-123\.\d+)/.match(placeMark.at('coordinates'))
  lng = /(-123\.\d+)/.match(placeMark.at('coordinates'))
  else
    puts "invalid lng"
    exit 1
  end

  if lat!=nil
    pm.lat = lat[0]
  else
    pm.lat = nil
  end
  if lng!=nil
    pm.lng = lng[0]
  else
    pm.lng = nil
  end


  pm.save!


  if pm.save
    puts "Parking meter Success"
  else
    puts "Parking meter didn't save"
  end
end




=begin

require 'openssl'
require 'csv'
require 'open-uri'
require 'geokit-rails'




file = File.expand_path('app/assets/sources/crime_2014.csv')


addresses = Array.new

csv_text = File.read(file)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  #save addresses to an array
  if /\w*Auto\w*/.match(row[0])
    addresses<< row[3]
  end

  #if array is not NULL, replace 'xx' in address with '00' for geocoding

  if addresses != nil
    addresses.each do |address|
      if /\w*XX\w*/.match(address)
        address.sub!('XX', '00')
      end
    end
  end


  addresses.each do |address|
    location = Geocoder.coordinates(address)
    if /49\.\d*/.match(location[0].to_s) && /-123\.\d*/.match(location[1].to_s)
      crime = CrimeDatum.new
      crime.lat = location[0]
      crime.lon = location[1]
      crime.save!
      puts "Crime success"
    else
      puts "crime save not successful"
    end

  end

end


=end
