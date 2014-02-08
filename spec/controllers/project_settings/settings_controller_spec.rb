require 'spec_helper'

describe ProjectSettings::SettingsController do
  it "should display settings form" do
    project = FactoryGirl.create :project
    get :index, project_slug: project.slug
    response.should render_template(:index)
  end
end
