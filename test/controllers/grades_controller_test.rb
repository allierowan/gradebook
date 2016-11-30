require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @student = students(:kvothe)
    @grade = grades(:hw)
  end

  test "can get new" do
    get new_student_grade_path(@student.id)
    assert_response :success
  end

  test "can create new grade" do
    post student_grades_path(@student.id), params: { grade: { value: "A", due_at: Date.new, assignment_name: "Advanced Sympathy Homework" } }
    assert_equal "Advanced Sympathy Homework", @student.grades.last.assignment_name
  end

  test "can get edit" do
    get edit_student_grade_path(@student.id, @grade.id)
    assert_response :success
  end

  test "can update a grade" do
    patch student_grade_path(@student.id, @grade.id), params: {grade: { value: "A+" } }
    assert_equal "A+", @student.grades.last.value
  end

  test "can delete a grade" do
    grade_id = @grade.id
    delete student_grade_path(@student.id, grade_id)
    refute Grade.find_by(id: grade_id)
  end

end
