class Service < ApplicationRecord
  has_many :appointments
  has_many :dogs
  has_many :walkers

  enum max_time: {quarter: 15, half: 30, hour: 60, halfday: 12, fullday: 24}
  enum category: [:package, :rate]
  enum bundle: [1, 2, 5, 7, 10, 15, 30]
  enum package: [:standard, :best, :premium]
  enum name: [:walking, :daycare, :inhome, :overnight]

  validates_presence_of :name, :category, :package, :bundle, :max_time, :pkg_amount, :hourly_rate

  validates_numericality_of :pkg_amount, :hourly_rate
end
