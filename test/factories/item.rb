FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    caption { Faker::Lorem.characters(16) }
    price { Faker::Number.between(from: 1, to: 9999) }
    is_active { true }
    genre_id { Faker::Number.between(from: 1, to: Genre.count) }
  end
end
