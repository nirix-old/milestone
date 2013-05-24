require 'spec_helper'

describe User do
  it "should return true for is_admin?" do
    user = FactoryGirl.create(:admin)
    user.is_admin?.should == true
  end

  it "should return false for is_admin?" do
    user = FactoryGirl.create(:user)
    user.is_admin?.should == false
  end
end
