require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: "testuser@example.com", password: "secret", password_confirmation: "secret")
  end

  test "should send post request to /login" do
    post login_url, params: { session: { email: @user.email, password: 'secret' } }, as: :json
    assert_response :success
  end

  test "should send delete request to /logout" do
    delete logout_url
    assert_response :no_content
  end
end
