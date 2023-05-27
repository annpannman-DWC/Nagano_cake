
Admin.create(email: 'mario@mario', password: 'aaaaaa')
sign_in admin


Customer.create!(
  email: "test#{n + 1}@test.com",
  first_name: "名#{n + 1}",
  last_name: "姓#{n + 1}",
  kana_first_name: "セイ",
  kana_last_name: "メイ",
  password: "123456",
  postal_code: "1234567",
  residence: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
  phone_number: "09012345678"
)


Admin.create!(
  email: ENV['mario@mario'],
  password: ENV['aaaaaa']
)


genres = [
  { id: 1, name: "ケーキ"},
  { id: 2, name: "チョコレート" },
  { id: 3, name: "焼き菓子"},
  { id: 4, name: "プリン" },
  { id: 5, name: "キャンディ" }
]

genres.each do |genre|
  Genre.create!(
    id: genre[:id],
    name: genre[:name],
  )
end


Item.create!(
  name: "メルト",
  caption: "今日のやることリストの一番上に「ケーキを食べる」を入れておけば、少なくとも 1 つのタスクは確実に完了する。",
  price: 2700,
  genre_id: 1,
  is_active: [['販売中', true], ['売り切れ', false]],
  image: open("./app/assets/images/cake-1.jpg")
)

Item.create!(
  name: "チェリー",
  caption: "カロリーのことは忘れて、ただ幸せになって。",
  price: 3100,
  genre_id: 1,
  is_active: [['販売中', true], ['売り切れ', false]],
  image: open("./app/assets/images/cake-2.jpg")
)

Item.create!(
  name: "ポップ",
  caption: "",
  price: 2100,
  genre_id: 1,
  is_active: [['販売中', true], ['売り切れ', false]],
  image: open("./app/assets/images/cake-3.jpg")
)

Item.create!(
  name: "13",
  caption: "",
  price: 1300,
  genre_id: 1,
  is_active: [['販売中', true], ['売り切れ', false]],
  image: open("./app/assets/images/cake-4.jpg")
)

Item.create!(
  name: "ポッピンシャワー",
  caption: "",
  price: 1700,
  genre_id: 1,
  is_active: [['販売中', true], ['売り切れ', false]],
  image: open("./app/assets/images/cake-5.jpg")
)

Item.create!(
  name: "24",
  caption: "",
  price: 2400,
  genre_id: 1,
  is_active: [['販売中', true], ['売り切れ', false]],
  image: open("./app/assets/images/cake-6.jpg")
)

Item.create!(
  name: "",
  caption: "",
  price: 1900,
  genre_id: 1,
  is_active: [['販売中', true], ['売り切れ', false]],
  image: open("./app/assets/images/cake-7.jpg")
)


Address.create!(
    address_name: "test#{n + 1}",
    postal_code: "123456#{n + 1}",
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    customer_id: n + 1
  )

5.times do |n|
  order = Order.create!(
    customer_id: n + 1,
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    postal_code: "123456#{n + 1}",
    address_name: "test#{n + 1}",
    shopping_cost: 800,
    total_price: 1000 + (n * 1000) + 800,
    payment_method: "クレジットカード"
  )


OrderDetail.create!(
  item_id: n + 1,
  order_id: order.id,
  quantity: n + 3,
  order_price: 1000 + (n * 1000)
)
end