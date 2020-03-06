require 'test_helper'

class User::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_post_index_url
    assert_response :success
  end

  test "should get show" do
    get user_post_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_post_edit_url
    assert_response :success
  end

end
