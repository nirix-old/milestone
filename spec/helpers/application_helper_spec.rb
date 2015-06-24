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

  describe "#flash_messages" do
    it "should be successful" do
      flash[:success] = "Did something successfully"
      expect(helper.flash_messages).to include("Did something successfully")
    end

    it "should warn" do
      flash[:warning] = "I warned you"
      expect(helper.flash_messages).to include("I warned you")
    end

    it "should show danger" do
      flash[:danger] = "You are terminated"
      expect(helper.flash_messages).to include("You are terminated")
    end
  end
end
