require 'test_helper'

class Api::V1::GoogleControllerTest < ActionController::TestCase
  test "should get google" do
    get :google
    assert_response :success
  end

end
