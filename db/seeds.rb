
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'


zip_file = open("http://data.vancouver.ca/download/kml/parking_meter_rates_and_time_limits.kmz")
source_path = "app/assets/sources"

file = File.open(File.expand_path('app/assets/sources/parking_meter_rates_and_time_limits.kml'))

ParkingMetersController.unzip_file(zip_file, source_path)
ParkingMetersController.parse(file)


csv_file = "ftp://webftp.vancouver.ca/opendata/csv/crime_2014.csv"
local_file = 'app/assets/sources/crime_2014.csv'

CrimeDataController.pull(csv_file,local_file)
CrimeDataController.parse(local_file)


ev_file = "ftp://webftp.vancouver.ca/OpenData/csv/electric_vehicle_charging_stations.csv"
local_ev = 'app/assets/sources/electric_vehicle_charging_stations.csv'

ElectricVehiclesController.pull(ev_file, local_ev)
ElectricVehiclesController.parse(local_ev)