class Owner < ApplicationRecord
  belongs_to :user
  has_many :dogs

  validates_presence_of :address, :city
end
