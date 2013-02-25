require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login as Admin" do
    post :create, username: 'Admin', password: 'test'
    assert_redirected_to root_url
  end

  test "should display error" do
    post :create, username: 'Fake', password: 'fake'
    assert_select 'div.alert.alert-error'
  end
end
