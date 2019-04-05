class Dog < ApplicationRecord
  belongs_to :owner
  has_many :appointments
  has_many :walkers
  has_many :services

  validates_presence_of :name, :age, :size, :breed, :restrictions, :friendliness, :image
  validates_numericality_of :age
end
