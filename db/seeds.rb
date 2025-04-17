# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テスト用データ

# 管理者アカウント（後日実装予定）
# Admin.find_or_create_by!(email: "a@a") do |admin|
#   admin.password = "123456"
# end


# ユーザー情報
user1 = User.find_or_create_by!(email: "a@a") do |user|
  user.display_name = "testA"
  user.password = "aaaaaa"
  user.users_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/no_image.jpg")),
    filename: "no_image.jpg"
  )
end

user2 = User.find_or_create_by!(email: "b@b") do |user|
  user.display_name = "testB"
  user.password = "bbbbbb"
  user.users_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/user_sample_icon.jpg")),
    filename: "user_sample_icon.jpg"
  )
end


# ジャンル情報
genre1 = Genre.find_or_create_by!(name: "キッチン家電・ガジェット") do |genre|
  genre.additional_info = "コーヒーメーカー・炊飯器・トースター・ミキサー"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon1.jpg")),
    filename: "genre_icon1.jpg"
  )
end

genre2 = Genre.find_or_create_by!(name: "生活家電") do |genre|
  genre.additional_info = "洗濯機・エアコン・電子レンジ・掃除機"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon2.jpg")),
    filename: "genre_icon2.jpg"
  )
end

genre3 = Genre.find_or_create_by!(name: "オーディオ・音響機器") do |genre|
  genre.additional_info = "スピーカー・イヤホン・アンプ・CDプレーヤー"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon3.jpg")),
    filename: "genre_icon3.jpg"
  )
end

genre4 = Genre.find_or_create_by!(name: "パソコン・周辺機器") do |genre|
  genre.additional_info = "ノートパソコン・キーボード・マウス・PC用カメラ"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon4.jpg")),
    filename: "genre_icon4.jpg"
  )
end

genre5 = Genre.find_or_create_by!(name: "スマホタブレット・周辺機器") do |genre|
  genre.additional_info = "保護フィルム・スマホケース・タッチペン・モバイルバッテリー"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon5.jpg")),
    filename: "genre_icon5.jpg"
  )
end

genre6 = Genre.find_or_create_by!(name: "カメラ・周辺機器") do |genre|
  genre.additional_info = "レンズ・クリーナー・三脚・ドローン"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon6.jpg")),
    filename: "genre_icon6.jpg"
  )
end

genre7 = Genre.find_or_create_by!(name: "ヘルスケア・フィットネスガジェット") do |genre|
  genre.additional_info = "スマートウォッチ・スマートリング・マッサージ機・心拍計"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon7.jpg")),
    filename: "genre_icon7.jpg"
  )
end

genre8 = Genre.find_or_create_by!(name: "ゲーム機・ゲームアクセサリー") do |genre|
  genre.additional_info = "コントローラー・ゲーミングモニター・ゲーミングキーボード"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon8.jpg")),
    filename: "genre_icon8.jpg"
  )
end

genre9 = Genre.find_or_create_by!(name: "DIY・工具ガジェット") do |genre|
  genre.additional_info = "電動インパクトドライバー・作業用ライト・チェーンソー"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon9.jpg")),
    filename: "genre_icon9.jpg"
  )
end

genre10 = Genre.find_or_create_by!(name: "旅行・アウトドアガジェット") do |genre|
  genre.additional_info = "テント・寝袋・キャリーケース・トラベルアダプター"
  genre.genres_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/genre_icon10.jpg")),
    filename: "genre_icon10.jpg"
  )
end


# レビュー情報
Review.find_or_create_by!(title: "お掃除ロボット買ったよ～") do |review|
  review.user = user1
  review.genre = Genre.find_by(name: "生活家電")
  review.rating = 5
  review.post = "全自動お掃除ロボット（◯◯バ）一ヶ月使ってみたよ～\n仕事から帰って来た時に髪の毛1本床に落ちてない環境に大満足!!\nみんなも使ってみてね～"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review1.jpg")),
    filename: "review1.jpg"
  )
end

Review.find_or_create_by!(title: "お気に入りのキーボード") do |review|
  review.user = user2
  review.genre = Genre.find_by(name: "パソコン・周辺機器")
  review.rating = 4
  review.post = "おしゃれなキーボード買いました。クリアカラーで写真映えする！\nただ、もう少し音が静かなら良かったかなと思いました。"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review2.jpg")),
    filename: "review2.jpg"
  )
end

Review.find_or_create_by!(title: "最高のコーヒープレスを入手した") do |review|
  review.user = user1
  review.genre = Genre.find_by(name: "キッチン家電・ガジェット")
  review.rating = 5
  review.post = "僕はコーヒーが好きでほぼ毎日入れるんだけど、いままでは忙しい朝にハンドドリップしてたんだけど流石に時間がなくて...\n時短のために〇〇のコーヒープレス使ってみたら大当たり！片付け簡単でおすすめです！"
  review.product_name = "◯◯製"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review3.jpg")),
    filename: "review3.jpg"
  )
end


# ターミナル表示
puts "adminアカウントの情報です"
puts "email = a@a"
puts "password = 123456"
puts "ユーザー1のアカウントの情報です"
puts "email = a@a"
puts "password = aaaaaa"
puts "ユーザー2のアカウントの情報です"
puts "email = b@b"
puts "password = bbbbbb"
