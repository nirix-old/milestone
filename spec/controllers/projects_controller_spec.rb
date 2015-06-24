require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it "should render index" do
    get :index
    expect(response).to render_template :index
  end

  it "should render show" do
    create(:project, name: 'Groot')
    get :show, slug: 'groot'
    expect(response).to render_template :show
  end
end
