require 'test_helper'

class TeacherActivatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get teacher_activates_create_url
    assert_response :success
  end

  test "should get destroy" do
    get teacher_activates_destroy_url
    assert_response :success
  end

end
