require 'spec_helper'

describe RoadmapController do
  before do
    @project = FactoryGirl.create :project
  end

  it "should list versions" do
    get :index, project_slug: @project.slug
    response.should render_template(:index)
  end

  it "should show version" do
    version = FactoryGirl.create :version
    get :show, project_slug: @project.slug, slug: version.slug
    response.should render_template(:show)
  end
end
