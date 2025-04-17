class ReviewsController < ApplicationController

  # ログインしないとアクセスをブロック
  before_action :authenticate_user!, only: [
    :new,
    :create,
    :edit,
    :update,
    :destroy
  ]

  def new
    @review = Review.new
  end

  def index 
    # indexビューのジャンルセレクトボックス用
    @genres = Genre.all
    # Gem Ransackの検索用 params[:q]に検索フォームの入力値が入る
    @q = Review.ransack(params[:q])
    # @q.resultで検索の実行、データベースから取り出し
    @reviews = @q.result

    # present?でgenre_idの存在のチェック
    if params[:genre_id].present?
      @selected_genre = Genre.find(params[:genre_id])
      # whereでジャンル絞り込み
      @reviews = @reviews.where(genre_id: params[:genre_id])
    end
  end
    
  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      flash[:notice] = "投稿されました"
      redirect_to review_path(@review.id)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューが更新されました"
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(
      :title,
      :rating,
      :genre_id,
      :product_name,
      :reviews_image,
      :post
    )
  end
end
