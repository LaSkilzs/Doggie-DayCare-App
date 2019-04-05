class CreateWalkers < ActiveRecord::Migration[5.2]
  def change
    create_table :walkers do |t|
      t.integer :age
      t.string :experience
      t.boolean :own_dog
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
