require 'test_helper'

class UserRelatiomshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_relatiomships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_relatiomships_destroy_url
    assert_response :success
  end

end
