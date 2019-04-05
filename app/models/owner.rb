class Owner < ApplicationRecord
  belongs_to :user

  validates_presence_of :address, :city
end
