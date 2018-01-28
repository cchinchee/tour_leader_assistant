class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.json :users_avatar
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128
      t.string :password_digest
      t.integer :role, default: 0
      
      t.timestamps null: false
    end
    add_index :users, :email
    add_index :users, :remember_token
    
  end
end

