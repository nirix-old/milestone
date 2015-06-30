require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'should render registration from' do
    get :new
    expect(response).to render_template 'users/new'
  end

  it 'should not render registration form' do
    allow(controller).to receive(:current_user).and_return(create(:user))

    get :new
    expect(response).to redirect_to root_path
  end

  it 'should create user' do
    post :create, user: {
      name: "I am Groot",
      username: "i_am_groot",
      password: "we_are_groot",
      password_confirmation: "we_are_groot",
      email: "i_am_groot@example.com"
    }

    expect(response).to redirect_to login_path
  end

  it 'should not create user' do
    post :create, user: {
      password_confirmation: "we_are_not_groot",
    }

    expect(response).to render_template 'users/new'
  end
end
