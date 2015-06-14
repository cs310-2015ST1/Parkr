require 'test_helper'

class UnzipperControllerTest < ActionController::TestCase
  test "should get unzip" do
    get :unzip
    assert_response :success
  end

end
