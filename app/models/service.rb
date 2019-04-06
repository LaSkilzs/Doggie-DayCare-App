class Service < ApplicationRecord
  has_many :appointments
  has_many :dogs
  has_many :walkers

  enum max_time: {quarter: "quarter", half: "half", hour: "hour", halfday: "halfday", fullday: "fullday"}
  enum category: {package: "package", rate: "rate"}
  enum bundle: {one: "one", two: "two", five: "five", seven: "seven", ten: "ten", fifteen: "fifteen", thirty: "thirty"}
  enum package: {standard: "standard", best: "best", premium: "premium"}
  enum name: {walking: "walking", daycare: "daycare", inhome: "inhome", overnight:"overnight"}

  validates_presence_of :name, :category, :package, :bundle, :max_time, :pkg_amount, :hourly_rate

  validates_numericality_of :pkg_amount, :hourly_rate
end
