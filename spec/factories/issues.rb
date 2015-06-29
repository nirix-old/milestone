FactoryGirl.define do
  factory :issue do
    sequence(:summary) { |n| "Issue #{n}" }
    sequence(:description) { |n| "This is issue #{n}" }

    association :project
    association :version
  end
end
