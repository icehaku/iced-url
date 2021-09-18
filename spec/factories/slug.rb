FactoryBot.define do
  factory :slug do
    short_url  { Faker::Internet.password(min_length: 5, max_length: 5) }
    target_url { Faker::Internet.url }
  end
end 
