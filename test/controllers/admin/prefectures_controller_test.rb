require "test_helper"

class Admin::PrefecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_prefectures_index_url
    assert_response :success
  end
end
