class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}"
  end

  def restrict_access(check_user_id) #アクセス権限のないユーザーへのアクセス制限
    unless current_user.id == check_user_id
      flash[:notice] = "あなたのアカウントではアクセス権限がありません"
      redirect_to root_path
    end
  end

  def admin?
    unless current_user&.admin?
      flash[:notice] = "あなたのアカウントは管理者権限がありません"
      redirect_to root_path
    end
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
