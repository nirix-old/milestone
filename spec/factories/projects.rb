FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    slug { name.parameterize }
    description { "I am #{name}" }

    after(:create) do |project, evaluator|
      create_list(:version, 1, project: project)
    end
  end
end
