class AddProductNameToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :product_name, :string, null: false
    add_index :reviews, :product_name
  end
end
