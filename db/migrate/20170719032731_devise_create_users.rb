class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string :name
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :remember_created_at
      t.boolean :is_admin?, default: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
