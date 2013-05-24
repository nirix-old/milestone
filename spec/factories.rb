FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:username) { |n| "user_#{n}" }
    email { "#{username}@example.com" }
    group_id 2

    factory :admin do
      group_id 1
    end
  end

  factory :group do
    sequence(:name) { |n| "Group #{n}" }
    is_admin false

    factory :admin_group do
      name "Admin"
      is_admin true
    end
  end
end
