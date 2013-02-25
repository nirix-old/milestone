require 'test_helper'

class Admin::ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, nil, { user_id: 1 }
    assert_response :success
  end
end
