class AddColumntoOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :image, :string
  end
end
