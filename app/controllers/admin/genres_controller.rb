class Admin::GenresController < ApplicationController

  # ログインしないとアクセスをブロック
  before_action :authenticate_admin_user!

  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    # renderエラー防止のため、@genresに値（全ジャンル）を代入しておく
    @genres = Genre.all
  
    if @genre.save
      flash[:notice] = "新しいジャンルが作成されました"
      redirect_to new_admin_genre_path
    else
      render :new
    end
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      flash[:notice] = "ジャンル情報を更新しました。"
      redirect_to new_admin_genre_path
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = "ジャンルを削除しました。"
    redirect_to new_admin_genre_path
  end

  
  private

  def genre_params
    params.require(:genre).permit(
      :name,
      :additional_info,
      :genres_image
    )
  end

end
