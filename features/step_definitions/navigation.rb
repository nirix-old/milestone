When(/^I go to the (.*?) page$/) do |page|
  case page
  when "login"
    visit login_path
  when "register"
    visit register_path
  end
end

Then(/^I should be on the (.*?) page$/) do |page|
  case page
  when "project listing"
    path = root_path
  end

  current_path.should eq(path)
end
