module Concerns
  module Validation
    private

    def validate_value_month
      year = DateTime.current.year
      month = DateTime.current.month

      sql = <<-SQL
        user_id = #{user_id} and
        date_part('year', created_at) = #{year} and
        date_part('month', created_at) = #{month}
      SQL
      record = self.class.where(sql)

      errors.add(:base, 'Значение может быть введено только раз в месяц') if record.exists?
    end
  end
end
