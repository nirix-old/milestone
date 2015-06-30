require 'rails_helper'

RSpec.describe Admin::IssueStatusesController, status: :controller do
  before :each do
    allow(controller).to receive(:current_user).and_return(create(:admin))
  end

  it "renders index" do
    get :index
    expect(response).to render_template :index
  end

  it "renders new issue status form" do
    get :new
    expect(response).to render_template :new
  end

  it "creates new issue status" do
    post :create, issue_status: { name: "Not a real thing" }
    expect(response).to redirect_to admin_issue_statuses_path
  end

  it "doesn't create issue status" do
    post :create, issue_status: { name: "" }
    expect(response).to render_template :new
  end

  it "renders edit issue status form" do
    issue_status = create(:issue_status)
    get :edit, id: issue_status.id
    expect(response).to render_template :edit
  end

  it "saves issue status" do
    issue_status = create(:issue_status)
    post :update, id: issue_status.id, issue_status: { name: "I'm real" }
    expect(response).to redirect_to admin_issue_statuses_path
  end

  it "doesn't save issue status" do
    issue_status = create(:issue_status)
    post :update, id: issue_status.id, issue_status: { name: "" }
    expect(response).to render_template :edit
  end
end
