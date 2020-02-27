require 'test_helper'

class User::ConductTrainingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_conduct_trainings_index_url
    assert_response :success
  end

end
