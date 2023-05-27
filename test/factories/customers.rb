FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { Faker::Name.first_name }
    last_name_kana { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    postal_code { Faker::Address.zip_code }
    password { Faker::Internet.password(min_length: 6) }
  end
end
