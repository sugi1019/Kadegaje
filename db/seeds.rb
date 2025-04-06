# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テスト用データ

# 管理者アカウント情報
# Admin.create!(
#   email: "a@a",
#   password: "123456"
# )

# ユーザー情報1
User.create!(
  display_name: "testA",
  email: "a@a",
  password: "aaaaaa"
)
　　　　　　　　　　　　　　　　　　　　　　# user.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
# ユーザー情報2
User.create!(
  display_name: "testB",
  email: "b@b",
  password: "bbbbbb"
)
# user.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')

ジャンル情報
Genre.create!(name: "キッチン家電・ガジェット")
　　　　　　　　　　　　　　　　　　　　　　# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "生活家電")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "オーディオ・音響機器")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "パソコン・周辺機器")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "スマートフォン・タブレット")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "カメラ・ビデオカメラ")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "ヘルスケア・フィットネスガジェット")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "ゲーム機・ゲームアクセサリー")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "DIY・工具ガジェット")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Genre.create!(name: "旅行・アウトドアガジェット")
# genre.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')

# レビュー情報
Review.create!(
  user_id: 1,
  genre_id: 2, #生活家電
  title: "お掃除ロボット買ったよ～",
  rating: 5,#integer ✩5評価
  post: "全自動お掃除ロボット（◯◯バ）一ヶ月使ってみたよ～\n仕事から帰っ来た時に髪の毛1本床に落ちてない環境に大満足!!\nみんなも使ってみてね～"
  # product_id: "◯◯製xxxx"
)
　　　　　　　　　　　　　　　　　　　　　　　　　# review.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Review.create!(
  user_id: 2,
  genre_id: 4, #パソコン・周辺機器
  title: "お気に入りのキーボード",
  rating: 4,#integer ✩5評価
  post: "おしゃれなキーボード買いました。クリアカラーで写真映えする！\nただ、もう少し音が静かなら良かったかなと思いました。"
  # product_id: "◯◯製xxxx"

)
# review.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')
Review.create!(
  user_id: 3,
  genre_id: 1, #キッチン家電・ガジェット
  title: "最高のコーヒープレスを入手した",
  rating: 5,#integer ✩5評価
  post: "僕はコーヒーが好きでほぼ毎日入れるんだけど、いままでは忙しい朝にハンドドリップしてたんだけど流石に時間がなくて...\n時短のために〇〇のコーヒープレス使ってみたら大当たり！片付け簡単でおすすめです！"
  # product_id: "◯◯製"
)
# review.image.attach(io: File.open(Rails.root.join('app/assets/images/hoge,jpg')),filename: 'hoge.jpg')



#ターミナルに表示されるメッセージ
puts "adminアカウントの情報です"
puts "email = a@a"
puts "password = 123456"
puts "ユーザー1のアカウントの情報です"
puts "email = a@a"
puts "password = aaaaaa"
puts "ユーザー2のアカウントの情報です"
puts "email = b@b"
puts "password = bbbbbb"