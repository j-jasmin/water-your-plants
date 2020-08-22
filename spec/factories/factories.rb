FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
    name { "jj" }
    password { "123456" }
  end

  factory :plant do
    user
    id { rand(1..100) }
    common_name { "Monstera" }
    nickname { "Monsti" }
    scientific_name { "Monstera deliciosa" }
    fertilizing_interval { 20 }
    watering_interval { 10 }

    trait :invalid do
      watering_interval { nil }
    end
  end

  factory :watering_event do
    plant
    date { Date.today - rand(1..30) }
    note { "One glass of water" }

    trait :invalid do
      date { nil }
    end
  end

  factory :fertilizing_event do
    assosication { :plant }
    date { Date.today - rand(1..30) }
    note { "A little" }

    trait :invalid do
      date { nil }
    end
  end
end
