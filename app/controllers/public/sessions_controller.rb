# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :members_state, only: [:create]

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

  protected

    # 退会しているかを判断するメソッド
  def members_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @member = Member.find_by(email: params[:member][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@member
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @member.valid_password?(params[:member][:password])
      ## 【処理内容3】
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    mypage_path(current_member)
    # super(resource)
  end
end
