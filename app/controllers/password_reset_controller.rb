class PasswordResetController < ApplicationController
  before_action :login_require

  def new
  end

  def create
    if params[:password].blank?
      flash[:alert] = 'Введите пароль'
      render :new
    elsif params[:password] != params[:password_require]
      flash[:alert] = 'Пароли не совпадают'
      render :new
    else
      user = User.find(session[:user_id])
      user.password = Digest::MD5.hexdigest(params[:password])
      user.save
      redirect_to login_path
    end
  end
end
