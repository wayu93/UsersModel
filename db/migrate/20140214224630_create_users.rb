class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :count
      t.string :remember_token
      t.timestamps
    end
  end
end
