class Invoice < ApplicationRecord
  belongs_to :appointment
  belongs_to :owner

  validates_presence_of :amount, :walked, :walk_rating, :notes, :owner_comments, :walker_comments

  validates_numericality_of :amount, :walk_rating
end
