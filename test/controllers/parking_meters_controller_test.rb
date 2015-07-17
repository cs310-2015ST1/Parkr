require 'test_helper'

class ParkingMetersControllerTest < ActionController::TestCase
  setup do
    @parking_meter = parking_meters(:one)
    @pm3 = parking_meters(:three)
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

  test "should parse test file" do
    test = "/pmtest.kml"
    ParkingMetersController.parse(test)
    assert_response :success
  end

end
