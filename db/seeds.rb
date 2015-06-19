# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'nokogiri'

file = File.open(File.expand_path('app/assets/sources/parking_meter_rates_and_time_limits.kml'))
data = Nokogiri::XML(file)

data.css("Placemark").each do |placeMark|

  pm = ParkingMeter.new

  pm.in_effect = /\d+\:\d+[\w|\s]+\d+\:+\d+[\w|\s]+/.match(placeMark.at('description'))
  pm.name = /[0-9]+/.match(placeMark.at('name'))
  pm.head_type = /(Single|Twin)/.match(placeMark.at('description'))
  pm.time_limit = /[0-9]\sHr/.match(placeMark.at('description'))
  pm.rate = /(\$[0-9]*\.[0-9]*)/.match(placeMark.at('description'))
  pm.pay_by_phone = /[0-9]+/.match(placeMark.at('name'))
  lat = /(49\.\d+)/.match(placeMark.at('coordinates'))
  lng = /(-123\.\d+)/.match(placeMark.at('coordinates'))


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

addresses = Array.new

CSV.read("/Users/mackenziesampson1/RubymineProjects/Parkr/app/assets/sources/crime_2014.csv") do |row|

  #save addresses to an array

  if row[0].contains? 'Auto'
    puts row[3]
    addresses<< row[3]
  end

  #if array is not NULL, replace 'xx' in address with '00' for geocoding

  if addresses != nil
    addresses.each do |address|
      if address.contains? 'xx'
        address.sub! 'xx', '00'
      end
    end
  end


  addresses.each do |address|
    location = Geokit::Geocoder::GoogleGeocoder.geocode(address)
    if location.success
      crime = CrimeDatum.new(location.lat, location.lng)
      crime.save!
      puts "Crime Success"
    elsif !location.success
      puts "crime save not successful"
    end

  end

end

=end
