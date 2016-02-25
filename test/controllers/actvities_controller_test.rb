require 'test_helper'

class ActvitiesControllerTest < ActionController::TestCase
  test "should get unit" do
    get :unit
    assert_response :success
  end

  test "should get topic" do
    get :topic
    assert_response :success
  end

  test "should get question" do
    get :question
    assert_response :success
  end

end
