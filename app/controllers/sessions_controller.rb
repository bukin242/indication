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
          flash[:info] = 'Вход выполнен'
          redirect_to '/'
        else
          flash[:alert] = 'Пароль не подходит'
          render :new
        end
      else
        if params[:password] == "#{@user.name}#{@user.lastname}"
          session[:user_id] = @user.id
          session.delete(:admin)
          flash[:info] = 'Вход выполнен'
          redirect_to '/'
        else
          flash[:alert] = 'Пароль не подходит'
          render :new
        end
      end
    else
      flash[:alert] = 'Пользователя не существует'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:admin)
    flash[:info] = 'Вы вышли'
    redirect_to '/login'
  end
end
