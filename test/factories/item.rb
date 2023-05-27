FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    caption { Faker::Lorem.characters(number: 16) }
    price { Faker::Number.between(from: 1, to: 9999) }
    is_active { true }
    genre_id { FactoryBot.create(:genre).id }
  end
end
