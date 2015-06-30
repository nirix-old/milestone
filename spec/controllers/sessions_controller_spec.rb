require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'should render login form' do
    get :new
    expect(response).to render_template :new
  end

  it 'should not render login form' do
    allow(controller).to receive(:current_user).and_return(create(:user))

    get :new
    expect(response).to redirect_to root_path
  end

  it 'should log user in' do
    user = create(:user, password: 'password123', password_confirmation: 'password123')
    post :create, username: user.username, password: 'password123'
    expect(response).to redirect_to root_path
  end

  it 'should not log user in' do
    post :create
    expect(response).to render_template :new
  end

  it 'should log user out' do
    delete :destroy
    expect(response).to redirect_to root_path
  end
end
