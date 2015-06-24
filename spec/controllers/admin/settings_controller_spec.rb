require 'rails_helper'

RSpec.describe Admin::SettingsController, type: :controller do
  it "renders index" do
    allow(controller).to receive(:current_user).and_return(create(:admin))

    get :index
    expect(response).to render_template 'admin/settings/index'
  end
end
