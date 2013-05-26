require 'spec_helper'

describe "User registration" do
  it "should register user" do
    visit register_path
    fill_in 'Name',     with: 'Test User'
    fill_in 'Username', with: 'test_user'
    fill_in 'Email',    with: 'test.user@example.com'
    fill_in 'Password', with: 'iamatestuser'
    fill_in 'Confirm Password', with: 'iamatestuser'
    click_button 'Create Account'

    current_path.should eq(login_path)
    page.should have_content("you may now login")
  end

  it "should display errors" do
    visit register_path
    click_button 'Create Account'

    current_path.should eq(register_path)
    page.should have_content("Please correct the following errors")
  end
end
