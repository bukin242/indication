class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :cold_water
  has_many :hot_water
end
