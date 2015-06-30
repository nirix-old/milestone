FactoryGirl.define do
  factory :issue do
    sequence(:summary) { |n| "Issue #{n}" }
    sequence(:description) { |n| "This is issue #{n}" }

    association :project
    association :version
    association :type, factory: :issue_type
    association :status, factory: :issue_status
  end
end
