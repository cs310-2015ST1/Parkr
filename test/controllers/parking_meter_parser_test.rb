require "test/unit"

class ParkingMeterParserTest < Test::Unit::TestCase
  setup do
    file = "/pmtest.kml"
    ParkingMetersController.parse(file)
  end

  def test_not_specified

  end
end