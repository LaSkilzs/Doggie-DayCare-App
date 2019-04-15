class Walker < ApplicationRecord
  belongs_to :user

  enum experience: {training: "training", experienced: "experienced", certified: "certified", apprentice: "apprentice" }

  # validates_presence_of :age, :experience, :rating
  # validates_numericality_of :age, :rating
end
