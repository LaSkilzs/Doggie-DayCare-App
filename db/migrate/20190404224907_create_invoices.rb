class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :amount
      t.references :appointment, foreign_key: true
      t.boolean :walked
      t.integer :walk_rating
      t.string :notes
      t.string :owner_comments
      t.string :walker_comments

      t.timestamps
    end
  end
end
