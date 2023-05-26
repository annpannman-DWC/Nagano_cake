FactoryBot.define do
  factory :cart_item do
    association :customer
    association :item
    amount { 7 }
  end
end
