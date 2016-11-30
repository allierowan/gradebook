require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest

  test "teacher can create students" do
    User.find(users(:elodin).id).update(personable: Teacher.find(teachers(:elodin).id))
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    post students_path, params: { student: { full_name: "Kvothe Kingkiller", email: "kvothe@theuniversity.com" } }
    assert_equal "Kvothe Kingkiller", Student.last.full_name
    assert_equal "Master Elodin", Student.last.teacher.full_name
  end

  test "must be logged in as teacher to create students" do
    post students_path, params: { student: { full_name: "Kvothe Kingkiller", email: "kvothe@theuniversity.com" } }
    assert_redirected_to "/"
    assert_equal "You don't have access to this action", flash[:alert]
  end

  test "student can create a login" do
    post users_path, params: { user: { email: "kvothe@theuniversity.com", password: "password" } }
    assert_redirected_to student_path(User.last.personable_id)
    assert_equal "Kvothe Kingkiller", User.last.personable.full_name
    assert_equal "Student", User.last.personable_type
  end

  test "student cannot create a login if their email is not already in the db" do
    post users_path, params: { user: { email: "willem@theuniversity.com", password: "password" } }
    assert_equal "You have not been added to the roster yet", flash[:alert]
  end

end
