FactoryGirl.define do
  factory :issue_type do
    sequence(:name) { |n| "Type {#n}" }
  end
end
