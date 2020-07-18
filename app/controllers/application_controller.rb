class ApplicationController < ActionController::Base

  def login?
    session[:user_id].present?
  end

  def admin?
    session[:admin]
  end

  helper_method :login?
  helper_method :admin?

  private

  def admin_require
    unless session[:admin]
      redirect_to login_path
    end
  end

  def login_require
    unless session[:user_id]
      redirect_to login_path
    end
  end
end
