class ParkingMeter < ActiveRecord::Base
=begin
  acts_as_gmappable, :process_geocoding => false
  def gmaps4rails_address
    "#{lat}, #{lng}"
  end
=end
=begin
  acts_as_mappable :lat => :lat,
                   :lng => :lng,
                   :units => :kms
=end

end
