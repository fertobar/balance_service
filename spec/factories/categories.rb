FactoryBot.define do
  factory :category do
    code { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.sentence }
  end
end
