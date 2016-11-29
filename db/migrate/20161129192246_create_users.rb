class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :full_name
      t.text :password_hash
      t.string :email
      t.string :string

      t.timestamps
    end
  end
end
