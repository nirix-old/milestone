require 'spec_helper'

describe VersionsController do
  before :all do
    @version = FactoryGirl.create :version
  end

  it "should list versions" do
    get :index, project_slug: @version.project.slug
    response.should render_template(:index)
  end

  it "should show version" do
    get :show, project_slug: @version.project.slug, slug: @version.slug
    response.should render_template(:show)
  end
end
