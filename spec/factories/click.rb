FactoryBot.define do
  factory :click do
    slug 
    remote_ip  { Faker::Internet.ip_v4_address }
  end
end
