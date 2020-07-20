class UsersAdminController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user
      flash[:alert] = I18n.t('controllers.users.exists')
      @user = User.new
      render :new
    else
      @user = User.create(
        username: user_params[:username],
        password: Digest::MD5.hexdigest(user_params[:password]),
        admin: true
      )

      if @user.valid?
        redirect_to login_path
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
