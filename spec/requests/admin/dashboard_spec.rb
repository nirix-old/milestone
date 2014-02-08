require 'spec_helper'

describe "AdminCP" do
  it "should allow admin" do
    admin = FactoryGirl.create(:admin)
    login(admin.username, 'bazinga')

    visit admin_path
    current_path.should eq(admin_path)
    expect(page).to have_css "#page-title", text: 'Dashboard'
  end

  it "should deny guest" do
    visit admin_path
    expect(page).to have_css "#page-title", text: 'Access denied'
  end

  it "should deny user" do
    user = FactoryGirl.create(:user)
    login(user.username, 'bazinga')

    visit admin_path
    current_path.should eq(admin_path)
    expect(page).to_not have_css "#page-title", text: 'Dashboard'
  end
end
