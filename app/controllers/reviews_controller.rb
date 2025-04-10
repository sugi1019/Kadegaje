class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
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
