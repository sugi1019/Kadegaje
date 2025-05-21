class ReviewsController < ApplicationController

  # ログインしないとアクセスをブロック authenticate_user_or_admin_user!でadmin_userもdestroyだけは使えるように設定
  before_action :authenticate_user_or_admin_user!, only: :destroy
  before_action :authenticate_user!, only: [
    :new,
    :create,
    :edit,
    :update
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

    # .order(created_at: :desc)で投稿を新しい順にする .page(params[:page])でページネーションの設定 最後に.per(数値)追加すると表示件数指定できる
    @reviews = @reviews.order(created_at: :desc).page(params[:page])
  end
    
  def show
    # find_by(id: params[:id]) = find_by(id: "123") 存在しないURLを検索した時のエラー表示をさせないためのコード
    @review = Review.find_by(id: params[:id])
    # find_by で存在しない場合 nill になる unlessで存在しない場合の処理をする
    unless @review
      flash[:alert] = "指定されたページは存在しません"
      # and returnで処理を終了させる
      redirect_to reviews_path and return
    end
    @comments = @review.comments.order(created_at: :desc)
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
    # find_byを使って存在しないURLを検索した時のエラー表示をさせないためのコード
    @review = Review.find_by(id: params[:id])
    unless @review
      flash[:alert] = "指定されたページは存在しません"
      # and returnで処理を終了させる
      redirect_to reviews_path and return
    end

    if @review.user_id != current_user.id
      flash[:alert] = "他のユーザーのレビューの編集はできません"
      redirect_to reviews_path
    end
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
    if admin_user_signed_in?
      # 管理者削除用
      redirect_to admin_reviews_path
    else
      # ユーザー自身削除用
      redirect_to reviews_path
    end
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

  # ログインしてるのがuserかadmin_user以外ならアクセスをブロック
  def authenticate_user_or_admin_user!
    unless user_signed_in? || admin_user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end
