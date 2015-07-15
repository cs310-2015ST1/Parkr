=begin
class ElectricVehicleParser

require 'openssl'
require 'csv'
require 'open-uri'

file = File.expand_path('../app/assets/sources/electric_vehicle_charging_stations.csv')

#open csv and save locally
open("ftp://webftp.vancouver.ca/OpenData/csv/electric_vehicle_charging_stations.csv") do |ftp|
  open(file, 'w') do |f|
    f.write(ftp.read)
  end
end


csv_text = File.read(file)
csv = CSV.parse(csv_text, :headers =>true)
csv.each do |row|
  ev_lat = row[0].to_f
  ev_lon = row[1].to_f

  puts ev_lat, ev_lon

  ev = ElectricVehicle.new(ev_lat, ev_lon)

  if ev.save!
    puts "EV save successful"
  else
    puts "EV save not successful"
  end

  end
end=end
