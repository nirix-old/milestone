require 'spec_helper'

describe SessionsController do
  it 'should log user in' do
    user = FactoryGirl.create(:user, password: 'password123')
    post :create, user: { username: user.username, password: 'password123' }
    response.should redirect_to(root_path)
  end

  it 'should not log user in' do
    post :create
    response.should render_template :new
  end
end
