require 'spec_helper'

describe "Projects" do
  before :all do
    @project = FactoryGirl.create :project, info: "Test project description"
  end

  it "should list projects" do
    visit root_path
    current_path.should eq(root_path)
    expect(page).to have_css "#page-title", text: 'Projects'
  end

  it "should show project info" do
    visit project_path(slug: @project.slug)
    expect(page).to have_css "#page-title", text: @project.name
  end
end
