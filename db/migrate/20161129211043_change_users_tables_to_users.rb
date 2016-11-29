class ChangeUsersTablesToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :users_tables, :users
  end
end
