require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, nil, { user_id: 1 }
    assert_response :success
  end

  test "should deny access for User #2" do
    get :index, nil, { user_id: 2 }
    assert_response 403
  end

  test "should deny access for guest" do
    get :index, nil
    assert_response 403
  end
end
