class IndicateController < ApplicationController
  before_action :login_require

  def new
  end

  def create
    if cold_water.present? || hot_water.present?
      if cold_water.present?
        @cold_water = ColdWater.create(user_id: user.id, value: cold_water)
        render :new and return if @cold_water.invalid?
      end

      if hot_water.present?
        @hot_water = HotWater.create(user_id: user.id, value: hot_water)
        render :new and return if @hot_water.invalid?
      end
    else
      flash[:alert] = I18n.t('controllers.indicate.blank')
      render :new
    end
  end

  private

  def user
    @user ||= User.find(session[:user_id])
  end

  def cold_water
    params[:cold_water]
  end

  def hot_water
    params[:hot_water]
  end
end
