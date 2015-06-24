require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  before :all do
    @project = create(:project, name: "Groot")
  end

  it 'should list projects' do
    visit root_path
    expect(page).to have_text 'I am Groot'
  end

  it 'should show project' do
    visit project_path(@project.slug)
    expect(page).to have_text 'I am Groot'
  end
end
