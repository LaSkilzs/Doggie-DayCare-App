class ChangeColumnOnSerivces < ActiveRecord::Migration[5.2]
  def change
    rename_column :services, :package, :bundle
  end
end
