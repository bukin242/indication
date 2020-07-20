class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      if @user.password
        if @user.password == Digest::MD5.hexdigest(params[:password])
          session[:user_id] = @user.id
          session[:admin] = @user.admin
          flash[:info] = I18n.t('controllers.sessions.login')
          redirect_to root_path
        else
          flash[:alert] = I18n.t('controllers.sessions.password_incorrect')
          render :new
        end
      else
        if params[:password] == "#{@user.name}#{@user.lastname}"
          session[:user_id] = @user.id
          session.delete(:admin)
          flash[:info] = I18n.t('controllers.sessions.login')
          redirect_to password_reset_path
        else
          flash[:alert] = I18n.t('controllers.sessions.password_incorrect')
          render :new
        end
      end
    else
      flash[:alert] = I18n.t('controllers.sessions.user_not_exists')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:admin)
    flash[:info] = I18n.t('controllers.sessions.logout')

    redirect_to login_path
  end
end
