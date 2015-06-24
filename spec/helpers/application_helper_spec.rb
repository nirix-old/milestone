require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#error_messages_for" do
    it "should render '_error_messages_for' template" do
      project = build(:project)
      project.slug = nil
      project.save
      expect(helper.error_messages_for(project)).to include("alert alert-danger")
    end
  end

  describe "#error_messages_panel_for" do
    it "should render '_error_messages_panel' template" do
      project = build(:project)
      project.slug = nil
      project.save
      expect(helper.error_messages_panel_for(project)).to include("panel panel-danger")
    end
  end
end
