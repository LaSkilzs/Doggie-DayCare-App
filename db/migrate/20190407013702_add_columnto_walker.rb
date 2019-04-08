class AddColumntoWalker < ActiveRecord::Migration[5.2]
  def change
    add_column :walkers, :image, :string
  end
end
