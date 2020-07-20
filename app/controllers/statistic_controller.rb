class StatisticController < ApplicationController
  before_action :login_require
  before_action :admin_require
  LIMIT = 3

  def index
    if params[:type].present?

      sql = <<-SQL
        with suitable_users as (
          select user_id, sum(value) as sum_value
            from #{(params[:type] == 'cold_water' ? 'cold_waters' : 'hot_waters')}
           group by user_id order by sum(value) desc
           limit #{LIMIT}
        )
        select * from users join suitable_users on suitable_users.user_id = users.id
      SQL

      @users = User.find_by_sql(sql)
    end
  end
end
