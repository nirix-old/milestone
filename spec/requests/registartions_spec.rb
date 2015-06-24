require 'rails_helper'

RSpec.describe "Registartions", type: :request do
  it "should create account" do
    post users_path, user: {
      name: "I am Groot",
      username: "i_am_groot",
      password: "we_are_groot",
      password_confirmation: "we_are_groot",
      email: "i_am_groot@example.com"
    }

    expect(response).to redirect_to login_path
  end

  it "should not create account" do
    post users_path, user: {
      password: "i_are_groot",
      password_confirmation: "we_are_groot",
      email: "i_am_groot@example.com"
    }

    expect(response).to render_template 'users/new'
  end
end
