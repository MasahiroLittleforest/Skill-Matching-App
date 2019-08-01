require 'test_helper'

class StudentControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get student_show_url
    assert_response :success
  end

  test "should get edit" do
    get student_edit_url
    assert_response :success
  end

  test "should get update" do
    get student_update_url
    assert_response :success
  end

  test "should get destroy" do
    get student_destroy_url
    assert_response :success
  end

end
