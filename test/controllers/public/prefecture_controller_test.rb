require 'test_helper'

class Public::PrefectureControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get public_prefecture_show_url
    assert_response :success
  end
end
