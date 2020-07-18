class UsersController < ApplicationController
  before_action :admin_require?

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user
      flash[:alert] = 'Пользователь уже существует'
      @user = User.new
      render :new
    else
      @user = User.create(
        username: user_params[:username],
        name: user_params[:name],
        lastname: user_params[:lastname],
        address: user_params[:address]
      )

      if @user.valid?
        flash[:info] = 'Пользователь создан'
        redirect_to login_path
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :lastname, :address)
  end
end
