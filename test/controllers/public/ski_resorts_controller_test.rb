require "test_helper"

class Public::SkiResortsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_ski_resorts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_ski_resorts_show_url
    assert_response :success
  end
end
