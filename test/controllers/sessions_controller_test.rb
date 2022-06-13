require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should send post request to /login" do
    post login_url
    assert_response :success
  end

  test "should send delete request to /logout" do
    delete logout_url
    assert_response :success
  end
end
