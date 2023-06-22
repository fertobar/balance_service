FactoryBot.define do
  factory :product do
    code { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.sentence }
    category_id { 1 }
  end
end
