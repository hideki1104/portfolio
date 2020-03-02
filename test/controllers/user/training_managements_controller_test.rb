require 'test_helper'

class User::TrainingManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_training_managements_index_url
    assert_response :success
  end

  test "should get show" do
    get user_training_managements_show_url
    assert_response :success
  end

end
