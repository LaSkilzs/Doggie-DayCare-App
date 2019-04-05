class Walker < ApplicationRecord
  belongs_to :user

  validates_presence_of :age, :experience, :own_dog, :rating
  validates_numericality_of :age, :rating
end
