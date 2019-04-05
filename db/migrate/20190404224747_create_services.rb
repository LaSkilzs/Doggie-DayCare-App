class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.string :type
      t.string :package
      t.string :max_time
      t.float :pkg_amount
      t.float :hourly_rate

      t.timestamps
    end
  end
end
