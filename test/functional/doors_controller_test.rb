require 'test_helper'

class DoorsControllerTest < ActionController::TestCase
  setup do
    @door = doors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create door" do
    assert_difference('Door.count') do
      post :create, :door => @door.attributes
    end

    assert_redirected_to door_path(assigns(:door))
  end

  test "should show door" do
    get :show, :id => @door.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @door.to_param
    assert_response :success
  end

  test "should update door" do
    put :update, :id => @door.to_param, :door => @door.attributes
    assert_redirected_to door_path(assigns(:door))
  end

  test "should destroy door" do
    assert_difference('Door.count', -1) do
      delete :destroy, :id => @door.to_param
    end

    assert_redirected_to doors_path
  end
end
