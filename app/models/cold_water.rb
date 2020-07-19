class ColdWater < ApplicationRecord
  include Concerns::Validation
  validates :value, presence: true, numericality: { only_integer: true }
  validate :validate_value_month, on: :create
end
