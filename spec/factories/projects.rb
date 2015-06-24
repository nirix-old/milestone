FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    slug { name.parameterize }
    description { "I am #{name}" }
  end
end
