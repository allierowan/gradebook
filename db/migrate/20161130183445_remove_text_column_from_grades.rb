class RemoveTextColumnFromGrades < ActiveRecord::Migration[5.0]
  def change
    remove_column :grades, :text
  end
end
