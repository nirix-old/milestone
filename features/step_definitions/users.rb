Given(/^I am not logged in$/) do
  delete logout_path
end

When(/^there is a user with the username of "(.*?)" and password of "(.*?)"$/) do |username, password|
  FactoryGirl.create :user, username: username, password: password, password_confirmation: password
end
