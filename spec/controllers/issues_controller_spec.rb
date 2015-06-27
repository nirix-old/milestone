require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  before :each do
    @project = create(:project)
  end

  it "should list issues" do
    get :index, project_slug: @project.slug
    expect(response).to render_template :index
  end

  it "should render new issue form" do
    get :new, project_slug: @project.slug
    expect(response).to render_template :new
  end

  it "should create issue" do
    allow(controller).to receive(:current_user).and_return(create(:user))

    version = create(:version)

    post :create, project_slug: @project.slug, issue: {
      summary: "Test issue",
      description: "Testing 123",
      version_id: version.id
    }

    expect(response).to redirect_to project_issue_path(Issue.last.project.slug, Issue.last)
  end
end
