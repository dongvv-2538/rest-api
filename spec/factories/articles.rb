FactoryBot.define do
  factory :article do
    title { "Sample Article" }
    content { "Awesome content" }
    slug {"sample-article"}
  end
end
