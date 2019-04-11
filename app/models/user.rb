class User < ApplicationRecord
  has_secure_password
  has_many :owners
  has_many :walkers


   enum role: {owner: "owner", walker: "walker"}


  validates_presence_of :name, :email, :username, :role, :password_digest
  validates :name, :username, :email, :password_digest, uniqueness: true
  validates_length_of :username,  minimum: 5
  validates_length_of :password_digest,  minimum: 8
end
