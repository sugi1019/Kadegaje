class Admin::UsersController < ApplicationController

  # ログインしないとアクセスをブロック
  before_action :authenticate_admin_user!
  
  def index
    # Gem Ransackの検索用 params[:q]に検索フォームの入力値が入る
    @q = User.ransack(params[:q])
    # @q.resultで検索の実行、データベースから取り出し .page(params[:page])でページネーションの設定 最後に.per(数値)追加すると表示件数指定できる
    @users = @q.result.page(params[:page])
  end
end
