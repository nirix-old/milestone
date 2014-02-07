require 'spec_helper'

describe IssuesController do
  it "should list issues" do
    project = FactoryGirl.create :project
    get :index, project_slug: project.slug
    response.should render_template(:index)
  end
end
