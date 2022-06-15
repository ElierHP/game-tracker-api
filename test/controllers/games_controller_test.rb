require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: "testuser@example.com", password: "secret", password_confirmation: "secret")

    @game = Game.create(owned: true, title: 'test', platform: 'test platform', user_id: @user.id)

    # Login the User. Required for authenticated routes.
    post login_url, params: { session: { email: @user.email, password: 'secret' } }, as: :json
  end

  test "should get index" do
    get games_url, as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url(@user), params: { game: { owned: @game.owned, platform: @game.platform, title: @game.title, user_id: @game.user_id} }, as: :json
    end

    assert_response :created
  end

  test "should show game" do
    get game_url(@user), as: :json
    assert_response :success
  end

  test "should update game" do
    patch game_url(@user), params: { game: { owned: false, platform: 'test platform', title: 'tester', user_id: @user.id  } }, as: :json
    assert_response :success
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@user), as: :json
    end

    assert_response :no_content
  end
end
