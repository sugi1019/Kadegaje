class UsersController < ApplicationController
  # ログインしないとアクセスをブロック authenticate_user_or_admin_user!でadmin_userもdestroyだけは使えるように設定
  before_action :authenticate_user_or_admin_user!, only: :destroy
  # ゲストユーザーのユーザー編集へのアクセスをブロック
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_user!, only: [
    :edit,
    :update,
    :confirm_deletion
  ]

  def edit
    # 他の人のURLで編集画面に推移するのをブロック
    @user = current_user
    if params[:id].to_i != current_user.id
      flash[:alert] = "他のユーザーの編集はできません"
      redirect_to user_path(current_user)
    end
  end

  def show
    # 存在しないIDを検索した時のエラー対策でfind_byを使用
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:alert] = "指定されたページは存在しません"
      if current_user
        redirect_to user_path(current_user.id) and return
      end
      # ログインしてないときはtopページへ
      redirect_to root_path and return
    end
    # .order(created_at: :desc)で新しい順に並べ替える
    @reviews = @user.reviews.order(created_at: :desc).page(params[:page])
  end
  
  def update 
    @user = current_user
    if @user.update(user_params)
      # パスワード変更後に再ログイン bypass: true でユーザーが再ログインしなくてもログインを維持
      sign_in(@user, bypass: true)
      flash[:notice] = "更新されました"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in?
      # ゲストユーザーは削除できない
      if current_user.guest?
        flash[:alert] = "ゲストユーザーは削除できません"
        # return を使ってその場でdestroyアクションの処理を終了させる
        return redirect_to user_path(current_user)
      end
      # ユーザー自身削除用
      current_user.destroy
      flash[:notice] = "正常に削除されました"
      redirect_to root_path
    # 管理者削除用
    elsif admin_user_signed_in?
      User.find(params[:id]).destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to admin_users_path
    else
      redirect_to new_user_session_path
    end
  end

  def confirm_deletion
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(
      :display_name,
      :email,
      :password,
      :password_confirmation,
      :users_image
    ).tap do |blank|
      # tap do |blank| で更に変更を加える :passwordが空の場合は:passwordを削除
      # deviseではpasswordが空の時は更新されない
      if params[:user][:password].blank?
        blank.delete(:password)
        blank.delete(:password_confirmation)
      end
    end
  end

  # ログインしてるのがuserかadmin_user以外ならアクセスをブロック
  def authenticate_user_or_admin_user!
    unless user_signed_in? || admin_user_signed_in?
      redirect_to new_user_session_path
    end
  end

  # ログインしてるのがゲストユーザーならアクセスをブロック
  def ensure_guest_user
    # .guest?はuserモデルに記述してあるカスタムメソッド
    if current_user && current_user.guest?
      flash[:alert] = "ゲストユーザーのプロフィール編集への遷移は禁止されています。"
      redirect_to user_path(current_user)
    end
  end
  
end