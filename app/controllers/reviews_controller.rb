class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def show
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
  end

  def update
  end

  def destroy
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
