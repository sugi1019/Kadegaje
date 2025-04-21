class UsersController < ApplicationController
  # ログインしないとアクセスをブロック authenticate_user_or_admin_user!でadmin_userもdestroyだけは使えるように設定
  before_action :authenticate_user_or_admin_user!, only: :destroy
  before_action :authenticate_user!, only: [
    :edit,
    :update,
    :confirm_deletion
  ]

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
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
    # 管理者削除用
    if admin_user_signed_in?
      User.find(params[:id]).destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to admin_users_path
    # ユーザー自身削除用
    elsif user_signed_in?
      current_user.destroy
      flash[:notice] = "正常に削除されました"
      redirect_to root_path
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

end