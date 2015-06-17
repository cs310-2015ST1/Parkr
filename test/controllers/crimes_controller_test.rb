require 'test_helper'

class CrimesControllerTest < ActionController::TestCase
  setup do
    @crime = crimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crime" do
    assert_difference('Crime.count') do
      post :create, crime: { address: @crime.address }
    end

    assert_redirected_to crime_path(assigns(:crime))
  end

  test "should show crime" do
    get :show, id: @crime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crime
    assert_response :success
  end

  test "should update crime" do
    patch :update, id: @crime, crime: { address: @crime.address }
    assert_redirected_to crime_path(assigns(:crime))
  end

  test "should destroy crime" do
    assert_difference('Crime.count', -1) do
      delete :destroy, id: @crime
    end

    assert_redirected_to crimes_path
  end
end
