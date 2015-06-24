FactoryGirl.define do
  factory :usergroup do
    sequence(:name) { |n| "Group #{n}" }
    is_admin false
  end

  factory :admingroup, class: Usergroup do
    sequence(:name) { |n| "Admin Group #{n}" }
    is_admin true
  end
end
