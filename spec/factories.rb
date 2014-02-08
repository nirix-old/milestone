FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:username) { |n| "user_#{n}" }
    email { "#{username}@example.com" }
    password "bazinga"
    password_confirmation "bazinga"
    association :group

    factory :admin do
      association :group, is_admin: true
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

  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    slug { name.parameterize }
    info "Bazinga!"
  end

  factory :version do
    sequence(:name) { |n| "v1.#{n}.0" }
    slug { name.parameterize }
    description "Many fixes!"
    association :project
  end
end
