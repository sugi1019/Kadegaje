class UsersController < ApplicationController
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
    current_user.destroy
    flash[:notice] = "正常に削除されました"
    redirect_to root_path
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
      :password_confirmation
    ).tap do |blank|
      # tap do |blank| で更に変更を加える :passwordが空の場合は:passwordを削除
      # deviseではpasswordが空の時は更新されない
      if params[:user][:password].blank?
        blank.delete(:password)
        blank.delete(:password_confirmation)
      end
    end
  end

end