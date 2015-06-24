require 'rails_helper'

RSpec.describe ProjectSettings::VersionsController, type: :controller do
  before :each do
    @project = create(:project)
  end

  it "renders index" do
    get :index, project_slug: @project.slug
    expect(response).to render_template 'project_settings/versions/index'
  end

  it "renders new version form" do
    get :new, project_slug: @project.slug
    expect(response).to render_template 'project_settings/versions/new'
  end

  it "creates a new version" do
    post :create, project_slug: @project.slug, version: {
      name: "1.0.0",
      slug: "1.0.0",
      description: "Much fixes, very wow",
      status: 1
    }

    expect(response).to redirect_to project_settings_versions_path
  end

  it "renders edit version form" do
    get :edit, project_slug: @project.slug, id: @project.versions.first.id
    expect(response).to render_template 'edit'
  end

  it "saves the version" do
    post :update, project_slug: @project.slug, id: @project.versions.first.id, version: @project.versions.first.attributes
    expect(response).to redirect_to project_settings_versions_path
  end
end
