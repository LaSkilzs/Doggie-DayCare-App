class ChangeColumndefaultDog < ActiveRecord::Migration[5.2]
  def change
    change_column :walkers, :own_dog, :boolean, default: false
  end
end
