class AddNameEmailToParent < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :full_name, :text
    add_column :parents, :email, :text
  end
end
