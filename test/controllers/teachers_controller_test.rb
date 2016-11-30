require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "can create new teacher" do
    User.find(users(:elodin).id).update(personable: Teacher.find(teachers(:elodin).id))
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    post teachers_path params: { teacher: { full_name: "Mandrag", email: "mandrag@theuniversity.com" } }
    assert_response :redirect
    assert_equal "Mandrag", Teacher.last.full_name
  end

  test "can only create new teacher as a teacher" do
    post teachers_path params: { teacher: { full_name: "Mandrag", email: "mandrag@theuniversity.com" } }
    assert_redirected_to "/"
    assert_equal "You don't have access to this action", flash[:alert]
  end
end
