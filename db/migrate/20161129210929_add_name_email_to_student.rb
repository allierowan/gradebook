class AddNameEmailToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :full_name, :text
    add_column :students, :email, :text
  end
end
