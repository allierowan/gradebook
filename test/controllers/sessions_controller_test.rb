require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "can get login form" do
    get new_session_path
    assert_response :success
    assert_match(/Login/, response.body)
  end

  test "redirected to proper path based on user personable type" do
    User.find(users(:elodin).id).update(personable: Teacher.find(teachers(:elodin).id))
    post session_path, params: { email: "elodin@theuniversity.com", password: "password" }
    assert_redirected_to teacher_path(Teacher.find(teachers(:elodin).id))
  end

end
