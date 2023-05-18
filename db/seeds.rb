# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeds.rb

# ジャンルの初期データを追加
Genre.create(name: 'ケーキ')
Genre.create(name: 'マフィン')
Genre.create(name: '焼き菓子')
Genre.create(name: 'チョコレート')
Genre.create(name: 'プリン')

# ケーキの初期データを追加
10.times do
  genre = Genre.all.sample

  Item.create(
    name: Faker::Dessert.variety,
    caption: Faker::Lorem.paragraph,
    price: Faker::Number.within(range: 1000..5000),
    is_active: Faker::Boolean.boolean(true_ratio: 0.8),
    genre_id: genre.id
  )
end

puts 'Seeding completed!'