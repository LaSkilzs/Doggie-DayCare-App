class AddReferenceToAppointment < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :service, index: true
    add_foreign_key :appointments, :services 
  end
end
