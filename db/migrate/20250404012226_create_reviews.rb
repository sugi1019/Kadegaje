class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      # t.references :userでFK設定 foreign_key: trueで外部キー制約
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :title, null: false
      t.integer :rating, null: false
      t.text :post, null: false
      # 新しくproduct_nameを追加していますschema参照
      t.timestamps
    end    
    # :titleと:ratingにINDEXを追加
    add_index :reviews, :title
    add_index :reviews, :rating
  end
end
