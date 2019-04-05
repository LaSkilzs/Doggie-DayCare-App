class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :size
      t.string :restrictions
      t.string :friendliness
      t.string :image
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
