require 'test_helper'

class User::WeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_weights_new_url
    assert_response :success
  end

  test "should get index" do
    get user_weights_index_url
    assert_response :success
  end

end
