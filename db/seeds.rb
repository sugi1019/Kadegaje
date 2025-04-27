# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テスト用データ

# 管理者アカウント
# パスワードはルートディレクトリに".env"ファイルを作成して ADMIN_PASSWORD=xxx の形式で記述してください!!
AdminUser.find_or_create_by!(email: "a@a") do |admin_user|
  admin_user.password = ENV["ADMIN_PASSWORD"]
end

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

user3 = User.find_or_create_by!(email: "c@c") do |user|
  user.display_name = "testC"
  user.password = "cccccc"
  user.users_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/user_c.jpg")),
    filename: "user_c.jpg"
  )
end

user4 = User.find_or_create_by!(email: "d@d") do |user|
  user.display_name = "testD"
  user.password = "dddddd"
  user.users_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/user_d.jpg")),
    filename: "user_d.jpg"
  )
end

user5 = User.find_or_create_by!(email: "e@e") do |user|
  user.display_name = "testE"
  user.password = "eeeeee"
  user.users_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/user_e.jpg")),
    filename: "user_e.jpg"
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


# レビュー情報 12件ほど
Review.find_or_create_by!(title: "お掃除ロボット買ったよ～") do |review|
  review.user = user1
  review.genre = Genre.find_by(name: "生活家電")
  review.rating = 5
  review.post = "全自動お掃除ロボット（◯◯バ）一ヶ月使ってみたよ～仕事から帰って来た時に髪の毛1本床に落ちてない環境に大満足!!みんなも使ってみてね～"
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
  review.post = "おしゃれなキーボード買いました。クリアカラーで写真映えする！ただ、もう少し音が静かなら良かったかなと思いました。"
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
  review.post = "僕はコーヒーが好きでほぼ毎日入れるんだけど、いままでは忙しい朝にハンドドリップしてたんだけど流石に時間がなくて...時短のために〇〇のコーヒープレス使ってみたら大当たり！片付け簡単でおすすめです！"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review3.jpg")),
    filename: "review3.jpg"
  )
end

Review.find_or_create_by!(title: "デザインも音質も完璧なホワイトマイク！") do |review|
  review.user = user3
  review.genre = Genre.find_by(name: "オーディオ・音響機器")
  review.rating = 5
  review.post = "見た目に一目惚れして購入しました。シンプルで清潔感のあるホワイトカラーが最高にオシャレ！音質もクリアで、リモート会議でも配信でも大活躍しています。セッティングも簡単で、届いてすぐに使えました。これからも長く愛用したいマイクです。大満足の星5です！"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review4.jpg")),
    filename: "review4.jpg"
  )
end

Review.find_or_create_by!(title: "花柄や民族系のスマホケース10個") do |review|
  review.user = user2
  review.genre = Genre.find_by(name: "スマホタブレット・周辺機器")
  review.rating = 4
  review.post = "デザインがとにかく可愛くてお気に入りです！手に馴染む素材感も良く、持っているだけで気分が上がります。強いて言えば、もう少し耐衝撃性があると完璧でした。それでもデザイン重視なら大満足のスマホケースです！"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review5.jpg")),
    filename: "review5.jpg"
  )
end

Review.find_or_create_by!(title: "シルバー調電子レンジ") do |review|
  review.user = user5
  review.genre = Genre.find_by(name: "キッチン家電・ガジェット")
  review.rating = 5
  review.post = "高級感のあるシルバーカラーがキッチンにぴったり！操作もシンプルで使いやすく、温めムラもありません。見た目も性能も文句なしで、とても気に入っています！"
  review.product_name = "◯◯製"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review6.jpg")),
    filename: "review6.jpg"
  )
end

Review.find_or_create_by!(title: "白いエアコン買いました！") do |review|
  review.user = user2
  review.genre = Genre.find_by(name: "生活家電")
  review.rating = 5
  review.post = "すっきりしたホワイトデザインで、どんな部屋にも合います。冷暖房の効きも良く、音も静かで快適です。夏も冬もこれ一台で乗り越えられそうです！"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review7.jpg")),
    filename: "review7.jpg"
  )
end

Review.find_or_create_by!(title: "初めての一眼レフ") do |review|
  review.user = user4
  review.genre = Genre.find_by(name: "カメラ・周辺機器")
  review.rating = 5
  review.post = "初めての一眼レフでしたが、操作も思ったより簡単でした。写真が驚くほど綺麗に撮れて、旅行がさらに楽しくなりました！これからもたくさん写真を撮りたいと思います！"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review8.jpg")),
    filename: "review8.jpg"
  )
end

Review.find_or_create_by!(title: "インパクトレンチ買ったけど...") do |review|
  review.user = user4
  review.genre = Genre.find_by(name: "DIY・工具ガジェット")
  review.rating = 3
  review.post = "パワーはしっかりしていて、作業がだいぶ楽になりました。ただ、少し重たくて長時間使うと疲れます。もう少し軽量化されていたら★5だったかも。"
  review.product_name = "◯◯製"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review9.jpg")),
    filename: "review9.jpg"
  )
end

Review.find_or_create_by!(title: "モバイルバッテリー買ってみた～") do |review|
  review.user = user5
  review.genre = Genre.find_by(name: "旅行・アウトドアガジェット")
  review.rating = 3
  review.post = "コンパクトで持ち運びやすいのは良いポイント。ただ、フル充電できる回数が思ったより少なめでした。急な外出時の予備用としては十分使えます！"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review10.jpg")),
    filename: "review10.jpg"
  )
end

Review.find_or_create_by!(title: "体温計買いました") do |review|
  review.user = user3
  review.genre = Genre.find_by(name: "ヘルスケア・フィットネスガジェット")
  review.rating = 5
  review.post = "測定がとても早く、結果も正確で助かっています。操作もワンタッチで分かりやすく、家族みんなで使っています。デザインもシンプルで清潔感があり、大満足です！"
  review.product_name = "◯◯製xxxx"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review11.jpg")),
    filename: "review11.jpg"
  )
end

Review.find_or_create_by!(title: "24インチ薄型モニター") do |review|
  review.user = user1
  review.genre = Genre.find_by(name: "パソコン・周辺機器")
  review.rating = 4
  review.post = "作業領域が広がって、作業効率が格段に上がりました！発色も綺麗で動画鑑賞にもぴったりです。スタンドの高さ調整がもう少し自由にできたら完璧でした。"
  review.product_name = "◯◯製"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review12.jpg")),
    filename: "review12.jpg"
  )
end

Review.find_or_create_by!(title: "黒いワイヤレススピーカー購入！！") do |review|
  review.user = user3
  review.genre = Genre.find_by(name: "オーディオ・音響機器")
  review.rating = 5
  review.post = "小型なのに迫力ある音が楽しめて驚きました！ブラックカラーもシックで部屋に馴染みます。接続も安定していてストレスフリーです。かなりお気に入り！"
  review.product_name = "◯◯製"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review13.jpg")),
    filename: "review13.jpg"
  )
end

Review.find_or_create_by!(title: "洗礼されたデザインの冷蔵庫") do |review|
  review.user = user1
  review.genre = Genre.find_by(name: "生活家電")
  review.rating = 5
  review.post = "無駄のないデザインが本当に素敵で、インテリアに自然と溶け込みます。音も静かで冷えも抜群。シンプルを求めているならこれ一択だと思います！"
  review.product_name = "◯◯製"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review14.jpg")),
    filename: "review14.jpg"
  )
end

Review.find_or_create_by!(title: "トースター新調しました～") do |review|
  review.user = user5
  review.genre = Genre.find_by(name: "キッチン家電・ガジェット")
  review.rating = 4
  review.post = "シルバーの質感がとてもおしゃれで高級感があります。パンもカリッと美味しく焼き上がり、大満足！もう少しタイマーが細かく設定できたらさらに良かったかも。"
  review.product_name = "◯◯製"
  review.reviews_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("app/assets/images/review15.jpg")),
    filename: "review15.jpg"
  )
end

# ターミナル表示
puts "admin_userアカウントの情報です"
puts "email = a@a"
puts "password = #{ENV["ADMIN_PASSWORD"]}"
puts "ユーザー1のアカウントの情報です"
puts "email = a@a"
puts "password = aaaaaa"
puts "ユーザー2のアカウントの情報です"
puts "email = b@b"
puts "password = bbbbbb"
puts "ユーザー3のアカウントの情報です"
puts "email = c@c"
puts "password = cccccc"
puts "ユーザー4のアカウントの情報です"
puts "email = d@d"
puts "password = dddddd"
puts "ユーザー5のアカウントの情報です"
puts "email = e@e"
puts "password = eeeeee"

