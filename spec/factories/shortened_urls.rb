FactoryBot.define do
  factory :shortened_url do
    long_url { Faker::Code.long_url}
  end
end
