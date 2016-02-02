require 'test_helper'

class Api::V1::SmsControllerTest < ActionController::TestCase
  test "should get sms" do
    get :sms
    assert_response :success
  end

end
