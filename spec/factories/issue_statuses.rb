FactoryGirl.define do
  factory :issue_status do
    sequence(:name) { |n| "Status #{n}" }
    is_closed false
  end
end
