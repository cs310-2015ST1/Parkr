
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

zip_file = open("http://data.vancouver.ca/download/kml/parking_meter_rates_and_time_limits.kmz")
source_path = "/Users/mackenziesampson1/RubymineProjects/Parkr/app/assets/sources"


ParkingMetersController.unzip_file(zip_file, source_path)

CrimeDataController.pull

ElectricVehiclesController.pull

ParkingMetersController.parse
CrimeDataController.parse
ElectricVehiclesController.parse