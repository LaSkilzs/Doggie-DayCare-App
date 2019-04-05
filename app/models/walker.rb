class Walker < ApplicationRecord
  belongs_to :user

  enum experience: [:training, :experienced, :apprentice, :certified]

  validates_presence_of :age, :experience, :rating
  validates_numericality_of :age, :rating
end
