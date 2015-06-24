FactoryGirl.define do
  factory :version do
    sequence(:name) { |n| "Version #{n}" }
    slug { name.parameterize }
    sequence(:description) { |n| "#{n} fixes" }
    status 1
  end
end
