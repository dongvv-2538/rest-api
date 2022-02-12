FactoryBot.define do
  factory :article do
    title { "Sample Article" }
    content { "Awesome content" }
    sequence(:slug) {|n| "sample-article-#{n}"}
  end
end
