require 'spec_helper'

describe Admin::DashboardController do
  it "should allow Admin" do
    session[:user_id] = FactoryGirl.create(:admin).id
    get :index
    response.should render_template(:index)
  end

  it "should deny User" do
    session[:user_id] = FactoryGirl.create(:user).id
    get :index
    response.should render_template('errors/no_permission')
  end
end
