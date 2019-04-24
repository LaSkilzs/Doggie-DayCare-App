class Owner < ApplicationRecord
  belongs_to :user
  has_many :dogs
  has_many :invoices

  validates_presence_of :address, :city
end
