require 'rails_helper'

RSpec.describe ProjectSettings::SettingsController, type: :controller do
  it "renders index" do
    project = create(:project)
    get :index, project_slug: project.slug
    expect(response).to render_template 'project_settings/settings/index'
  end
end
