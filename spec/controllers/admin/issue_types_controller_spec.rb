require 'rails_helper'

RSpec.describe Admin::IssueTypesController, type: :controller do
  before :each do
    allow(controller).to receive(:current_user).and_return(create(:admin))
  end

  it "renders index" do
    get :index
    expect(response).to render_template :index
  end

  it "renders new issue type form" do
    get :new
    expect(response).to render_template :new
  end

  it "creates new issue type" do
    post :create, issue_type: { name: "Not a real thing" }
    expect(response).to redirect_to admin_issue_types_path
  end

  it "doesn't create issue type" do
    post :create, issue_type: { name: "" }
    expect(response).to render_template :new
  end

  it "renders edit issue type form" do
    issue_type = create(:issue_type)
    get :edit, id: issue_type.id
    expect(response).to render_template :edit
  end

  it "saves issue type" do
    issue_type = create(:issue_type)
    post :update, id: issue_type.id, issue_type: { name: "I'm real" }
    expect(response).to redirect_to admin_issue_types_path
  end

  it "doesn't save issue type" do
    issue_type = create(:issue_type)
    post :update, id: issue_type.id, issue_type: { name: "" }
    expect(response).to render_template :edit
  end
end
