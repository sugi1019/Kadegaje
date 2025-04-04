require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_destroy_url
    assert_response :success
  end

  test "should get confirm_deletion" do
    get users_confirm_deletion_url
    assert_response :success
  end
end
