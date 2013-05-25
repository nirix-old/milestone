require 'spec_helper'

describe ProjectsController do
  it "should list projects" do
    get :index
    response.should render_template(:index)
  end

  it "should display project information" do
    FactoryGirl.create :project, slug: 'bazinga'
    get :show, slug: 'bazinga'
    response.should render_template(:show)
  end
end
