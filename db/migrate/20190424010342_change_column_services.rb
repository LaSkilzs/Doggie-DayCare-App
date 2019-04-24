class ChangeColumnServices < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :pkg_amount, :decimal, :precision => 8, :scale => 2
    change_column :services, :hourly_rate, :decimal, :precision => 8, :scale => 2
  end
end
