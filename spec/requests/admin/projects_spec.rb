require 'spec_helper'

describe "Admin/Projects" do
  before do
    admin = FactoryGirl.create(:admin)
    login(admin.username, 'bazinga')
  end

  it "should create project" do
    visit new_admin_project_path
    expect(page).to have_css "#page-title", text: 'New Project'

    fill_in "Name", with: "Creation test"
    fill_in "Slug", with: "creation-test"
    click_button "Create"

    current_path.should eq(admin_projects_path)
    expect(page).to have_content "Creation test"
  end

  it "should list projects" do
    project = FactoryGirl.create :project
    visit admin_projects_path
    expect(page).to have_css "#page-title", text: 'Projects'
    expect(page).to have_content project.name
  end
end
