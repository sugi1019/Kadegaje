class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # deviseログイン後の画面推移先設定 現状初期設定のroot_pathに指定
  # def after_sign_in_path_for(resource)
  #   about_path ここに推移先のパスを指定
  # end

  # deviseサインアウト後の画面推移先設定
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
  end
end
