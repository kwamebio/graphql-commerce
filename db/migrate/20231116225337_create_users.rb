class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :password
      t.string :confirmation
      t.string :auth_token
      t.string :reset_password_token

      t.timestamps
    end
  end
end
