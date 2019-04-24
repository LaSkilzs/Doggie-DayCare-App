module AppointmentsHelper
  
  def self.booked?
    unless self.appointment.(:booked)
      self.appointment.toggle!(:booked)
      self.appointment.update!(walker_id: current_user)
    end
  end

end
