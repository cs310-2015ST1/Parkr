
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

#zip_file = open("http://data.vancouver.ca/download/kml/parking_meter_rates_and_time_limits.kmz")
#source_path = "/Users/ClaireHS/Parkr/app/assets/sources"


<<<<<<< HEAD
ParkingMetersController.unzip_file(zip_file, source_path)
CrimeDataController.pull
=======
#ParkingMetersController.unzip_file(zip_file, source_path)

#CrimeDataController.pull

>>>>>>> f35bc53de8009cf4cc3c7ced690052356f8b4420
ElectricVehiclesController.pull

#ParkingMetersController.parse
#CrimeDataController.parse
ElectricVehiclesController.parse