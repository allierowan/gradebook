require 'test_helper'

class ParentsControllerTest < ActionDispatch::IntegrationTest
  test "teacher can create parents inside student" do
    kvothe = Student.find(students(:kvothe).id)
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    post parents_path(student_id: kvothe.id), params: { parent: { full_name: "Arliden", email: "arlidenthebard@edema.com" } }
    assert_equal "Arliden", Parent.last.full_name
    assert_equal Parent.last, kvothe.parents.last
  end

  test "must be logged in as teacher to create parents" do
    kvothe = Student.find(students(:kvothe).id)
    post parents_path(kvothe.id), params: { parent: { full_name: "Arliden", email: "arlidenthebard@edema.com" } }
    assert_redirected_to "/"
    assert_equal "You don't have access to this action", flash[:danger]
  end

  test "parent can create login" do
    post users_path, params: { user: { email: "arlidenthebard@edema.com", password: "password" } }
    assert_redirected_to parent_path(User.last.personable_id)
    assert_equal "Arliden the Bard", User.last.personable.full_name
    assert_equal "Parent", User.last.personable_type
  end
end
