require 'test_helper'

class Admin::TrainingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_trainings_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_trainings_edit_url
    assert_response :success
  end

end
