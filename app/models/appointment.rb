class Appointment < ApplicationRecord
  belongs_to :dog
  belongs_to :walker
  belongs_to :service
  enum status: [:pending, :confirmed, :cancelled, :completed]

  validates_presence_of :date, :start_time, :status
end
