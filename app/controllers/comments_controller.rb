class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [
    :create,
    :destroy
  ]

  def create
    @review = Review.find(params[:review_id])
    # commentにuserを紐づけたいのでcreateではなくbuild+saveを使用
    @comment = @review.comments.build(params_comment)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_to review_path(@review.id)
    else
      render "reviews/show"
    end
  end

  def destroy
    # どのレビューなのか特定
    @review = Review.find(params[:review_id])
    # 特定したレビューの中のどのコメントなのか特定
    @comment = @review.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to review_path(@review.id)
  end

  private

  def params_comment
    params.require(:comment).permit(:post_comment)
  end
end
