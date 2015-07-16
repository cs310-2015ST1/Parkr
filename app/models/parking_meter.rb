class ParkingMeter < ActiveRecord::Base
  markable_as :favorite, :by => :user
  attr_accessor :visited
  reverse_geocoded_by :lat, :lng
  #after_validation :reverse_geocode
end
