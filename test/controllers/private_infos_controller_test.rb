require 'test_helper'

class PrivateInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get private_infos_show_url
    assert_response :success
  end

  test "should get new" do
    get private_infos_new_url
    assert_response :success
  end

  test "should get create" do
    get private_infos_create_url
    assert_response :success
  end

  test "should get edit" do
    get private_infos_edit_url
    assert_response :success
  end

  test "should get update" do
    get private_infos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get private_infos_destroy_url
    assert_response :success
  end

end
