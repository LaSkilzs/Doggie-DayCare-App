class AddPrecisonTtoServicesFloats < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :pkg_amount, :float, :precision => 8, :scale => 2
    change_column :services, :hourly_rate, :float, :precision => 8, :scale => 2
  end
end
