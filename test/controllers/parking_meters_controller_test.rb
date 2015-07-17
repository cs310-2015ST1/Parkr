require 'test_helper'

class ParkingMetersControllerTest < ActionController::TestCase
  setup do
    @parking_meter = parking_meters(:one)
    file = File.open(File.expand_path('app/assets/sources/pmtest.kml'))
    ParkingMetersController.parse(file)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create parking_meter" do
    assert_difference('ParkingMeter.count') do
      post :create, parking_meter: { head_type: @parking_meter.head_type, in_effect: @parking_meter.in_effect, lat: @parking_meter.lat, lng: @parking_meter.lng, name: @parking_meter.name, pay_by_phone: @parking_meter.pay_by_phone, rate: @parking_meter.rate, time_limit: @parking_meter.time_limit }
    end

    assert_redirected_to parking_meter_path(assigns(:parking_meter))
  end


  test "should update parking_meter" do
    patch :update, id: @parking_meter, parking_meter: { head_type: @parking_meter.head_type, in_effect: @parking_meter.in_effect, lat: @parking_meter.lat, lng: @parking_meter.lng, name: @parking_meter.name, pay_by_phone: @parking_meter.pay_by_phone, rate: @parking_meter.rate, time_limit: @parking_meter.time_limit }
    assert_redirected_to parking_meter_path(assigns(:parking_meter))
  end

  test "should destroy parking_meter" do
    assert_difference('ParkingMeter.count', -1) do
      delete :destroy, id: @parking_meter
    end

    assert_redirected_to parking_meters_path
  end

=begin
  test "should parse test file" do
    test = "/pmtest.kml"

    assert_response :success
  end
=end

  test "should have not-specified head-type" do
    pm1 = ParkingMeter.find_by_name("1")
    assert_equal("Not Specified", pm1.head_type, "Head-Type is specified, parsing issue")
  end

  test "should have not-specified rate" do
    pm2 = ParkingMeter.find_by_name("2")
    assert_equal("Not Specified", pm2.rate, "Rate is specified, parsing issue")
  end

  test "should have time-limit = 2 Hr" do
    pm3 = ParkingMeter.find_by_name("3")
    assert_equal("2 Hr", pm3.time_limit, "Time-Limit is not correct, parsing issue")
  end

end
