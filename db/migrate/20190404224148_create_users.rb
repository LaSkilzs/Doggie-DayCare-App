class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :role
      t.string :password_digest

      t.timestamps
    end
  end
end