require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'should log user in' do
    user = create(:user, password: 'password123', password_confirmation: 'password123')
    post :create, username: user.username, password: 'password123'
    expect(response).to redirect_to root_path
  end

  it 'should not log user in' do
    post :create
    expect(response).to render_template :new
  end
end
