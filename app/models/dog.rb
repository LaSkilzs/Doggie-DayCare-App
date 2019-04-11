class Dog < ApplicationRecord
  belongs_to :owner
  has_many :appointments
  has_many :walkers
  has_many :services

  enum friendliness: {aggressive: "aggressive", untrained: "untrained", playful: "playful" , passive: "passive", friendly: "friendly", trained: "trained"}
  enum restrictions: {medication: "medication", dogfood: "dogfood", diet: "diet", notsocial: "notsocial"}

  validates_presence_of :name, :age, :size, :breed, :restrictions, :friendliness, :image
  validates_numericality_of :age
end
