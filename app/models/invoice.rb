class Invoice < ApplicationRecord
  belongs_to :appointment
  belongs_to :owner

  validates_presence_of :amount

  validates_numericality_of :amount, :walk_rating
end