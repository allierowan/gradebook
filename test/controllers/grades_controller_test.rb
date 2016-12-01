require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @student = students(:kvothe)
    @grade = grades(:hw)
  end

  test "can get new" do
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    get new_student_grade_path(@student.id)
    assert_response :success
  end

  test "can create new grade" do
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    post student_grades_path(@student.id), params: { grade: { value: "A", due_at: Date.new, assignment_name: "Advanced Sympathy Homework" } }
    assert_equal "Advanced Sympathy Homework", @student.grades.last.assignment_name
  end

  test "can get edit" do
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    get edit_student_grade_path(@student.id, @grade.id)
    assert_response :success
  end

  test "can update a grade" do
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    patch student_grade_path(@student.id, @grade.id), params: {grade: { value: "A+" } }
    assert_equal "A+", @student.grades.last.value
  end

  test "can delete a grade" do
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    grade_id = @grade.id
    delete student_grade_path(@student.id, grade_id)
    refute Grade.find_by(id: grade_id)
  end

  test "can't get new grade if not logged in as teacher" do
    get new_student_grade_path(@student.id)
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:danger]
  end

  test "can't create grade if not logged in as teacher" do
    post session_path, params: { email: "fela@theuniversity.com", password: "password" }
    post student_grades_path(@student.id), params: { grade: { assignment_name: "an assignment", value: "A+", due_at: Date.new } }
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:danger]
  end
end
