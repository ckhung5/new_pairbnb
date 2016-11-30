class CreateUsers < ActiveRecord::Migration
def change
  create_table :users do |t|
      t.timestamps null: false
      t.string :email
      t.string :name
      t.string :encrypted_password, limit: 128
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128
    end

    add_index :users, :name
    add_index :users, :email
    add_index :users, :remember_token
  end
end
