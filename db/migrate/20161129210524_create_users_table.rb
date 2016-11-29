class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users_tables do |t|
      t.string :email
      t.text :password_hash
      t.integer :personable_id
      t.string :personable_type

      t.timestamps
    end
  end
end
