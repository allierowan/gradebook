class AddNameEmailToTeacher < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :full_name, :text
    add_column :teachers, :email, :text
  end
end
