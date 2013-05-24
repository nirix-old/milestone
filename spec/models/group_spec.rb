require 'spec_helper'

describe Group do
  it "should return true for is_admin?" do
    group = FactoryGirl.create(:admin_group)
    group.is_admin?.should == true
  end

  it "should not return true for is_admin?" do
    group = FactoryGirl.create(:group)
    group.is_admin?.should == false
  end
end
