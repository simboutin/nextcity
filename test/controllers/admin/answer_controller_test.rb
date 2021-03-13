require "test_helper"

class Admin::AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_answer_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_answer_create_url
    assert_response :success
  end
end
