require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_top_url
    assert_response :success
  end

  test "should get edit" do
    get admin_edit_url
    assert_response :success
  end
end
