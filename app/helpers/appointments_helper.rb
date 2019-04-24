module AppointmentsHelper
  
  def self.booked?
    unless self.appointment.(:booked)
      self.appointment.toggle!(:booked)
      self.appointment.update!(walker_id: current_user)
    end
  end

  def self.formatDate
    self.date.strftime('%B %d, %Y')
  end

  def self.formatTime
    self.start_time.strftime('%I:%M %P')
  end

end
