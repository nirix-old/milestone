require 'spec_helper'

describe UsersController do
  it "should register Spock" do
    user_data = {
      name:     'Spock',
      username: 'logical',
      email:    'spock@uss-enterprise.space',
      password: 'thisisillogicalcaptain',
      password_confirmation: 'thisisillogicalcaptain'
    }
    post :create, user: user_data
    response.should redirect_to(login_path)
  end

  it "should not register empty form" do
    user_data = {
      name:     '',
      username: '',
      email:    '',
      password: '',
      password_confirmation: ''
    }

    post :create, user: user_data
    response.should render_template("users/new")
  end
end
