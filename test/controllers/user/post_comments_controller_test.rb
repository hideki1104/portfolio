require 'test_helper'

class User::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get user_post_comments_edit_url
    assert_response :success
  end

end
