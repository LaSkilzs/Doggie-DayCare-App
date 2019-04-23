class AddBookedtoAppointmentColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :booked, :boolean, default: false
  end
end
