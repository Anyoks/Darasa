require 'test_helper'

class CampusControllerTest < ActionController::TestCase
  setup do
    @campu = campus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campu" do
    assert_difference('Campu.count') do
      post :create, campu: { campus_name: @campu.campus_name, institution_id: @campu.institution_id, location: @campu.location }
    end

    assert_redirected_to campu_path(assigns(:campu))
  end

  test "should show campu" do
    get :show, id: @campu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campu
    assert_response :success
  end

  test "should update campu" do
    patch :update, id: @campu, campu: { campus_name: @campu.campus_name, institution_id: @campu.institution_id, location: @campu.location }
    assert_redirected_to campu_path(assigns(:campu))
  end

  test "should destroy campu" do
    assert_difference('Campu.count', -1) do
      delete :destroy, id: @campu
    end

    assert_redirected_to campus_path
  end
end
