class AddForeignKeyToOwner < ActiveRecord::Migration[5.2]
  def change
    add_reference :invoices, :owner, index: true
    add_foreign_key :invoices, :owners
  end
end
