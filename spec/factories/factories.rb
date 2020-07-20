FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
    password { "123456" }
  end

  factory :plant do
    user
    common_name { "Monstera" }
    nickname { "Monsti" }
    scientific_name { "Monstera deliciosa" }
    watering_interval { 10 }
  end

  factory :watering_event do
    plant
    date { Date.today - rand(1..30) }
  end
end
