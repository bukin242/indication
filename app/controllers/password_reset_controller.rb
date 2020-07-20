class PasswordResetController < ApplicationController
  before_action :login_require

  def new
  end

  def create
    if params[:password].blank?
      flash[:alert] = I18n.t('controllers.password_require.blank')
      render :new
    elsif params[:password] != params[:password_require]
      flash[:alert] = I18n.t('controllers.password_require.require')
      render :new
    else
      user = User.find(session[:user_id])
      user.password = Digest::MD5.hexdigest(params[:password])
      user.save
      redirect_to login_path
    end
  end
end
