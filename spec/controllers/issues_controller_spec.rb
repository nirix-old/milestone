require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  it "should list issues" do
    project = create(:project)
    get :index, project_slug: project.slug
    expect(response).to render_template :index
  end
end
