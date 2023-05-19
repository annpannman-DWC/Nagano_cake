# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeds.rb

# # ジャンルの初期データを追加
# Genre.create(name: 'ケーキ')
# Genre.create(name: 'マフィン')
# Genre.create(name: '焼き菓子')
# Genre.create(name: 'チョコレート')
# Genre.create(name: 'プリン')

# # ケーキの初期データを追加
# genre1 = Genre.find_by(name: "ケーキ")
# genre2 = Genre.find_by(name: "パフェ")
# genre3 = Genre.find_by(name: "クッキー")

# unless genre1.nil? || genre2.nil? || genre3.nil?
#   Item.create(
#     name: "チョコレートケーキ",
#     caption: "濃厚なチョコレートのケーキです。",
#     price: 2500,
#     is_active: true,
#     genre_id: genre1.id
#   )

#   Item.create(
#     name: "ストロベリーパフェ",
#     caption: "新鮮なイチゴとヨーグルトのパフェです。",
#     price: 1800,
#     is_active: true,
#     genre_id: genre2.id
#   )

#   Item.create(
#     name: "バターココアクッキー",
#     caption: "バターとココアの風味が楽しめるクッキーです。",
#     price: 1200,
#     is_active: true,
#     genre_id: genre3.id
#   )

#   puts 'Seeding completed!'
# end