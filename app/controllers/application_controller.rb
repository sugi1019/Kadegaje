class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 管理者側ではヘッダーを表示しないためhelper_methodでviewsでもコントローラーのメソッドを使用可能にする
  helper_method :current_admin_user?

  # 現在サインインしてるのがadmin_userか判断
  def current_admin_user?
    current_admin_user.present?
  end
  


# deviseログイン後の画面推移先設定
def after_sign_in_path_for(resource)
  if resource.is_a?(AdminUser)
    # 管理者の場合 管理者側topへ
    admin_root_path
  else
    # ユーザー側のパス topへ
    root_path
  end
end

# deviseサインアウト後の画面推移先設定
def after_sign_out_path_for(resource_or_scope)
  if resource_or_scope == :admin_user
    # 管理者の場合 管理者側のサインインへ
    new_admin_user_session_path
  else
    # ユーザー側パス topへ
    root_path
  end
end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
  end
end