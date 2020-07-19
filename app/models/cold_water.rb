class ColdWater < ApplicationRecord
  validates :value, numericality: { only_integer: true }
end
