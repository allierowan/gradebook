require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "can create new teacher" do
    post teachers_path params: { teacher: { full_name: "Mandrag", email: "mandrag@theuniversity.com" } }
    assert_response :redirect
    assert_equal "Mandrag", Teacher.last.full_name
  end
end
