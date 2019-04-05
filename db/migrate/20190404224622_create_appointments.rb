class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :start_time
      t.string :status
      t.references :dog, foreign_key: true
      t.references :walker, foreign_key: true
      

      t.timestamps
    end
  end
end
