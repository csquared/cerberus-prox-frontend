require 'test_helper'

class AccessLogsControllerTest < ActionController::TestCase
  setup do
    @access_log = access_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:access_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create access_log" do
    assert_difference('AccessLog.count') do
      post :create, :access_log => @access_log.attributes
    end

    assert_redirected_to access_log_path(assigns(:access_log))
  end

  test "should show access_log" do
    get :show, :id => @access_log.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @access_log.to_param
    assert_response :success
  end

  test "should update access_log" do
    put :update, :id => @access_log.to_param, :access_log => @access_log.attributes
    assert_redirected_to access_log_path(assigns(:access_log))
  end

  test "should destroy access_log" do
    assert_difference('AccessLog.count', -1) do
      delete :destroy, :id => @access_log.to_param
    end

    assert_redirected_to access_logs_path
  end
end
