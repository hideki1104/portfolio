require 'test_helper'

class TraningsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tranings_new_url
    assert_response :success
  end

  test "should get index" do
    get tranings_index_url
    assert_response :success
  end

  test "should get show" do
    get tranings_show_url
    assert_response :success
  end

  test "should get edit" do
    get tranings_edit_url
    assert_response :success
  end

end
