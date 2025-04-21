# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
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

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    admin_root_path  # 管理者用のトップページにリダイレクト
  end

  # ログイン失敗時のリダイレクト先
  def after_failed_sign_in_path_for(resource)
    new_admin_user_session_path  # 管理者ログイン失敗時のリダイレクト先
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
