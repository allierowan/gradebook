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
end
