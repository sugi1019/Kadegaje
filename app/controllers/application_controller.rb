class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 管理者側ではヘッダーを表示しないためhelper_methodでviewsでもコントローラーのメソッドを使用可能にする
  helper_method :current_admin?

  # 現在サインインしてるのがadminか判断
  def current_admin?
    current_admin.present?
  end
  


 # deviseログイン後の画面推移先設定
def after_sign_in_path_for(resource)
  # .is_a?で指定したインスタンス(User)のインスタンスか判断
  if resource.is_a?(User)
    # ユーザー側のパス topへ
    root_path
  else
    # 管理者の場合 管理者側topへ
    admin_path
  end
end

# deviseサインアウト後の画面推移先設定
# resource_or_scope はdeviseメソッドの1つ 現在サインインしてるのがuserかadminか判断
def after_sign_out_path_for(resource_or_scope)
  # .is_a?で指定したインスタンス(User)のインスタンスか判断
  if resource_or_scope.is_a?(User)
    # ユーザー側パス topへ
    root_path
  else
    # 管理者の場合 管理者側のサインインへ
    new_admin_session_path
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
  end
end
