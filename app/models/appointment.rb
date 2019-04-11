class Appointment < ApplicationRecord
  belongs_to :dog
  belongs_to :walker
  belongs_to :service
  has_many :invoices
  enum status: {pending: "pending", confirmed: "confirmed", cancelled: "cancelled", completed: "completed"}

  validates_presence_of :date, :start_time, :status
end
