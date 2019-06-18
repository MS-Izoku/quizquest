class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :wins
      t.integer :score
      
      t.timestamps
    end
  end
end