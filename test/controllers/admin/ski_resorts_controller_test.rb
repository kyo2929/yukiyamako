require 'test_helper'

class Admin::SkiResortsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get admin_ski_resorts_new_url
    assert_response :success
  end

  test 'should get index' do
    get admin_ski_resorts_index_url
    assert_response :success
  end

  test 'should get show' do
    get admin_ski_resorts_show_url
    assert_response :success
  end
end
