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

  it "should not create issue" do
    post :create, project_slug: @project.slug, issue: { summary: "don't do it" }

    expect(response).to render_template :new
  end

  it "should show issue" do
    issue = create(:issue)
    get :show, project_slug: issue.project.slug, id: issue.id
    expect(response).to render_template :show
  end

  it "should render 404" do
    get :show, project_slug: @project.slug, id: 9999999
    expect(response).to render_template 'errors/404'
  end
end
