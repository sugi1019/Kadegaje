class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [
    :create,
    :destroy
  ]

  def create
    @review = Review.find(params[:review_id])
    # commentにuserを紐づけたいのでcreateではなくbuild+saveを使用
    @comment = @review.comments.build(comment_params)
    @comment.user = current_user
    # コメントの空投稿時のみリダイレクトさせてフラッシュメッセージを表示させる
    unless @comment.save
      flash[:alert] = "コメントの空投稿はできません\n※コメント投稿のみ非同期処理しています\nこのメッセージを消したい場合はリロードして下さい"
      redirect_to review_path(@review.id)
    end
  end

  def destroy
    # どのレビューなのか特定
    @review = Review.find(params[:review_id])
    # 特定したレビューの中のどのコメントなのか特定
    @comment = @review.comments.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:post_comment)
  end
end
