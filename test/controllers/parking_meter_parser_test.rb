require "test/unit"

class ParkingMeterParserTest < Test::Unit::TestCase
  setup do
    @pm3 = parking_meters(:three)
  end

  def test_not_specified
    ParkingMetersController.parse(@pm3)
  end
end