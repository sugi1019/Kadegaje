# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テスト用データ

#管理者後日実装予定
# 管理者アカウント情報
# Admin.create!(
#   email: "a@a",
#   password: "123456"
# )


# ユーザー情報1
user1 = User.create!(
  display_name: "testA",
  email: "a@a",
  password: "aaaaaa"
)
user1.users_image.attach(io: File.open(Rails.root.join('app/assets/images/no_image.jpg')), filename: 'no_image.jpg')

# ユーザー情報2
user2 = User.create!(
  display_name: "testB",
  email: "b@b",
  password: "bbbbbb"
)
user2.users_image.attach(io: File.open(Rails.root.join('app/assets/images/user_sample_icon.jpg')), filename: 'user_sample_icon.jpg')


# ジャンル情報
genre1 = Genre.create!(
  name: "キッチン家電・ガジェット",
  additional_info: "コーヒーメーカー・炊飯器・トースター・ミキサー"
)
genre1.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon1.jpg')), filename: 'genre_icon1.jpg')

genre2 = Genre.create!(
  name: "生活家電",
  additional_info: "洗濯機・エアコン・電子レンジ・掃除機"
)
genre2.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon2.jpg')), filename: 'genre_icon2.jpg')

genre3 = Genre.create!(
  name: "オーディオ・音響機器",
  additional_info: "スピーカー・イヤホン・アンプ・CDプレーヤー"
)
genre3.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon3.jpg')), filename: 'genre_icon3.jpg')

genre4 = Genre.create!(
  name: "パソコン・周辺機器",
  additional_info: "ノートパソコン・キーボード・マウス・PC用カメラ"
)
genre4.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon4.jpg')), filename: 'genre_icon4.jpg')

genre5 = Genre.create!(
  name: "スマホタブレット・周辺機器",
  additional_info: "保護フィルム・スマホケース・タッチペン・モバイルバッテリー"
)
genre5.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon5.jpg')), filename: 'genre_icon5.jpg')

genre6 = Genre.create!(
  name: "カメラ・周辺機器",
  additional_info: "レンズ・クリーナー・三脚・ドローン"
)
genre6.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon6.jpg')), filename: 'genre_icon6.jpg')

genre7 = Genre.create!(
  name: "ヘルスケア・フィットネスガジェット",
  additional_info: "スマートウォッチ・スマートリング・マッサージ機・心拍計"
)
genre7.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon7.jpg')), filename: 'genre_icon7.jpg')

genre8 = Genre.create!(
  name: "ゲーム機・ゲームアクセサリー",
  additional_info: "コントローラー・ゲーミングモニター・ゲーミングキーボード"
)
genre8.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon8.jpg')), filename: 'genre_icon8.jpg')

genre9 = Genre.create!(
  name: "DIY・工具ガジェット",
  additional_info: "電動インパクトドライバー・作業用ライト・チェーンソー"
)
genre9.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon9.jpg')), filename: 'genre_icon9.jpg')

genre10 = Genre.create!(
  name: "旅行・アウトドアガジェット",
  additional_info: "テント・寝袋・キャリーケース・トラベルアダプター"
)
genre10.genres_image.attach(io: File.open(Rails.root.join('app/assets/images/genre_icon10.jpg')), filename: 'genre_icon10.jpg')


# レビュー情報1
review1 = Review.create!(
  user_id: 1,
  genre_id: 2, #生活家電
  title: "お掃除ロボット買ったよ～",
  rating: 5, # integer ✩5評価
  post: "全自動お掃除ロボット（◯◯バ）一ヶ月使ってみたよ～\n仕事から帰っ来た時に髪の毛1本床に落ちてない環境に大満足!!\nみんなも使ってみてね～",
  product_name: "◯◯製xxxx"
)
review1.reviews_image.attach(io: File.open(Rails.root.join('app/assets/images/review1.jpg')),filename: 'review1.jpg')

# レビュー情報2
review2 = Review.create!(
  user_id: 2,
  genre_id: 4, #パソコン・周辺機器
  title: "お気に入りのキーボード",
  rating: 4, # integer ✩5評価
  post: "おしゃれなキーボード買いました。クリアカラーで写真映えする！\nただ、もう少し音が静かなら良かったかなと思いました。",
  product_name: "◯◯製xxxx"
)
review2.reviews_image.attach(io: File.open(Rails.root.join('app/assets/images/review2.jpg')),filename: 'review2.jpg')

# レビュー情報3
review3 = Review.create!(
  user_id: 1,
  genre_id: 1, #キッチン家電・ガジェット
  title: "最高のコーヒープレスを入手した",
  rating: 5, # integer ✩5評価
  post: "僕はコーヒーが好きでほぼ毎日入れるんだけど、いままでは忙しい朝にハンドドリップしてたんだけど流石に時間がなくて...\n時短のために〇〇のコーヒープレス使ってみたら大当たり！片付け簡単でおすすめです！",
  product_name: "◯◯製"
)
review3.reviews_image.attach(io: File.open(Rails.root.join('app/assets/images/review3.jpg')),filename: 'review3.jpg')



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