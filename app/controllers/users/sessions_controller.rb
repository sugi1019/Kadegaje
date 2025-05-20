# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # ゲストユーザー用
  def guest_sign_in
    user = User.guest
    # ゲストログイン時ゲストユーザーのレビューをすべて削除
    user.reviews.delete_all
    sign_in user
    flash[:notice] = "このゲストアカウントは共有アカウントのため、他の方がログインすると投稿が削除されます。\n
    ※ログインのたびに投稿は自動的に削除されますので、重要な内容は投稿しないでください。\n
    なお、次回のゲストログインまでは投稿データが残り続け、正規ユーザーからも閲覧可能です。\n
    投稿を削除したい場合は、再度ゲストログインしてください。"
    redirect_to root_path
  end

end
