require 'test_helper'

class CutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cut_index_url
    assert_response :success
  end

  test "should get show" do
    get cut_show_url
    assert_response :success
  end

  test "should get edit" do
    get cut_edit_url
    assert_response :success
  end

end
