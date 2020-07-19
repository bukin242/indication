class HotWater < ApplicationRecord
  validates :value, numericality: { only_integer: true }
end
