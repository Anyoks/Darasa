require 'test_helper'

class Api::V1::ProcesspaymentControllerTest < ActionController::TestCase
  test "should get process" do
    get :process
    assert_response :success
  end

end
