require 'test_helper'

class CrimeDataControllerTest < ActionController::TestCase
  setup do
    @crime_datum = crime_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crime_data)
  end


  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crime_datum" do
    assert_difference('CrimeDatum.count') do
      post :create, crime_datum: { lat: @crime_datum.lat, lon: @crime_datum.lon }
    end

    assert_redirected_to crime_datum_path(assigns(:crime_datum))
  end

  test "should show crime_datum" do
    get :show, id: @crime_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crime_datum
    assert_response :success
  end

  test "should update crime_datum" do
    patch :update, id: @crime_datum, crime_datum: { lat: @crime_datum.lat, lon: @crime_datum.lon }
    assert_redirected_to crime_datum_path(assigns(:crime_datum))
  end

  test "should destroy crime_datum" do
    assert_difference('CrimeDatum.count', -1) do
      delete :destroy, id: @crime_datum
    end

    assert_redirected_to crime_data_path
  end
end
