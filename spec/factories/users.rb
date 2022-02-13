FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "jsmith#{n}" }
    name { "John Smith" }
    url { "http://example.com" }
    avatar_url { "http://example.com/avatar" }
    password { "password" }
    provider { "github" }
  end
end
