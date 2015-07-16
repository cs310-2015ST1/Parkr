require 'gmaps4rails'
class ElectricVehicle < ActiveRecord::Base
  attr_accessor :lat, :lon
  acts_as_gmappable :process_geocoding => false

end
