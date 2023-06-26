# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email:"d@d",password:"dddddd")

Members = member.create!(
  [
    {email: 'p@p', name: 'pppppp', nick_name: 'ぴー', password: 'pppppp', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")},
    {email: 'o@o', name: 'oooooo', nick_name: 'おー', password: 'oooooo', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'u@u', name: 'uuuuuu', nick_name: 'ゆー', password: 'uuuuuu', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'y@y', name: 'yyyyyy', nick_name: 'わい', password: 'yyyyyy', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 't@t', name: 'tttttt', nick_name: 'てぃー', password: 'tttttt', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'r@r', name: 'rrrrrr', nick_name: 'あーる', password: 'rrrrrr', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user6.jpg")}
  ]
)

Review.create!(
  [
    {title: 'ケランチム', review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review1.jpg"), filename:"sample-review1.jpg"), body: '本場韓国の味を自宅で楽しめるセットです。',price: '1200',prefecture: 13,food_category: 1, is_active: 'true', member_id: 1 },
    {title: 'サムギョプサル', review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review2.jpg"), filename:"sample-review2.jpg"), body: '本場韓国の味を自宅で楽しめるセットです。',price: '3900',prefecture: 13,food_category: 1, is_active: 'true', member_id: 1 },
    {title: 'ハンバーガーセット', review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review3.jpg"), filename:"sample-review3.jpg"), body: 'ハンバーガーセットが簡単にできるセットです！',price: '2200',prefecture: 12,food_category: 1, is_active: 'true', member_id:2 },
    {title: '松阪牛A5ランク弁当', review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review4.jpg"), filename:"sample-review4.jpg"), body: '松阪牛A5ランクの贅沢弁当！軽く温めるのがおすすめ！',price: '2500',prefecture: 24,food_category: 1, is_active: 'true', member_id:3 },
    {title: 'tops　チョコレートケーキ', review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review5.jpg"), filename:"sample-review5.jpg"), body: '赤坂Topsのケーキ！誕生日にぴったり！スポンジとチョコクリームの層に胡桃がはいって飽きのこない一品！',price: '2900',prefecture: 13,food_category: 5, is_active: 'false', member_id:4 },
    {title: 'ダッチベイベー', review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review6.jpg"), filename:"sample-review6.jpg"), body: '自宅で簡単ダッチベイビーセット！オーブン必須です！鉄板付き！',price: '2200',prefecture: 14,food_category: 5, is_active: 'true', member_id:5 },
    {title: 'アメリカンハンバーガーセット', review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review7.jpg"), filename:"sample-review7.jpg"), body: 'アメリカビーフたっぷりのパティ！アメリカのハンバーガーが家で食べられるって楽しい！',price: '1800',prefecture: 23,food_category: 1, is_active: 'true', member_id:6 },
    {title: 'フルーツケーキセット', review_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review8.jpg"), filename:"sample-review8.jpg"), body: '松阪牛A5ランクの贅沢弁当！軽く温めるのがおすすめ！',price: '3000',prefecture: 8,food_category: 5, is_active: 'false', member_id:4 }
  ]
)