class AddAdditionalInfoToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :additional_info, :string, null: false
  end
end
