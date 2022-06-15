require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should not show user unless logged in" do
    get user_url(@user), as: :json
    assert_response :unauthorized
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: 'one@gmail.com', password: 'secret', password_confirmation: 'secret' } }, as: :json
    end

    assert_response :created
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: 'onetest@gmail.com', password: 'secrets', password_confirmation: 'secrets'} }, as: :json
    
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
