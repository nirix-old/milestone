require 'spec_helper'

describe ProjectSettings::VersionsController do
  before :all do
    @version = FactoryGirl.create :version
  end

  it "should list versions" do
    get :index, project_slug: @version.project.slug
    response.should render_template(:index)
  end

  it "should display new version form" do
    get :new, project_slug: @version.project.slug
    response.should render_template(:new)
  end

  it "should display edit version form" do
    get :edit, project_slug: @version.project.slug, id: @version.id
    response.should render_template(:edit)
  end
end
