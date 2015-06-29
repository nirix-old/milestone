require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  before :each do
    allow(controller).to receive(:current_user).and_return(create(:admin))
  end

  it "renders index" do
    get :index
    expect(response).to render_template :index
  end

  it "renders new user form" do
    get :new
    expect(response).to render_template :new
  end

  it "renders edit user form" do
    user = create(:user)
    get :edit, id: user.id
    expect(response).to render_template :edit
  end

  it "creates a new user" do
    usergroup = create(:usergroup)

    post :create, user: {
      name: "Some random user",
      username: "some_random_user",
      password: "itsasecret",
      password_confirmation: "itsasecret",
      email: "random_user@example.com",
      usergroup_id: usergroup.id
    }

    expect(response).to redirect_to admin_users_path
  end

  it "updates the user" do
    user = create(:user)

    post :update, id: user.id, user: {
      name: "Updated User",
      email: "updated.user@example.com",
    }

    expect(response).to redirect_to admin_users_path
  end

  it "should not create user" do
    post :create, user: { username: 'nobody' }
    expect(response).to render_template :new
  end

  it "should not update user" do
    user = create(:user)
    post :update, id: user.id, user: { username: '' }
    expect(response).to render_template :edit
  end
end
