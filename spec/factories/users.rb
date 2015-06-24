FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:username) { |n| "user_#{n}" }
    password "some_user"
    email { "#{username}@example.com".downcase }

    association :usergroup
  end

  factory :admin, class: User do
    sequence(:name) { |n| "Admin #{n}" }
    sequence(:username) { |n| "admin_#{n}" }
    password "some_admin"
    email { "#{username}@example.com".downcase }

    association :usergroup, is_admin: true
  end
end
