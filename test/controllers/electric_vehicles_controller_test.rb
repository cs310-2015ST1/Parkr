require 'test_helper'

class ElectricVehiclesControllerTest < ActionController::TestCase
  setup do
    @electric_vehicle = electric_vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electric_vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create electric_vehicle" do
    assert_difference('ElectricVehicle.count') do
      post :create, electric_vehicle: { lat: @electric_vehicle.lat, lon: @electric_vehicle.lon }
    end

    assert_redirected_to electric_vehicle_path(assigns(:electric_vehicle))
  end

  test "should show electric_vehicle" do
    get :show, id: @electric_vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @electric_vehicle
    assert_response :success
  end

  test "should update electric_vehicle" do
    patch :update, id: @electric_vehicle, electric_vehicle: { lat: @electric_vehicle.lat, lon: @electric_vehicle.lon }
    assert_redirected_to electric_vehicle_path(assigns(:electric_vehicle))
  end

  test "should destroy electric_vehicle" do
    assert_difference('ElectricVehicle.count', -1) do
      delete :destroy, id: @electric_vehicle
    end

    assert_redirected_to electric_vehicles_path
  end
end
