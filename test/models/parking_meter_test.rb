require 'test_helper'

class ParkingMeterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def testDB
    for pm in ParkingMeter.find_each
      for pm1 in ParkingMeter.all
        if pm.lat == pm1.lat && pm.lng == pm1.lng && pm != pm1
          puts "Duplicate"
        end
      end
    end
  end
end



#file = File.open(File.expand_path('app/assets/sources/pmtest.kml'))