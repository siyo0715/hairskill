require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get contacts_about_url
    assert_response :success
  end

  test "should get confirm" do
    get contacts_confirm_url
    assert_response :success
  end

end
