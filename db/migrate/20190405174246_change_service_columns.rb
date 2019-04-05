class ChangeServiceColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :services, :type, :package
    add_column :services, :category, :string
  end
end
