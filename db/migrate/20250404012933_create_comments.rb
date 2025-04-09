class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      # t.references :userでFK設定 foreign_key: trueで外部キー制約
      t.references :user, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.text :post_comment, null: false
      t.timestamps
    end
  end
end
