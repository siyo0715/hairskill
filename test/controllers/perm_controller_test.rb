require 'test_helper'

class PermControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get perm_index_url
    assert_response :success
  end

  test "should get show" do
    get perm_show_url
    assert_response :success
  end

  test "should get edit" do
    get perm_edit_url
    assert_response :success
  end

end
