require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is personable" do
    kilvin = Teacher.find(teachers(:kilvin).id)
    kilvin.user = User.find(users(:kilvin).id)
    assert_equal "kilvin@theuniversity.com", kilvin.user.email
    assert_equal "Teacher", kilvin.user.personable_type
  end
end
