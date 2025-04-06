class RenameGenreToNameInGenres < ActiveRecord::Migration[6.1]
  def change
    # genreカラムからnameカラムへ変更
    rename_column :genres, :genre, :name
  end
end
