class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :value
      t.string :assignment_name
      t.string :text
      t.integer :student_id
      t.date :due_at

      t.timestamps
    end
  end
end
