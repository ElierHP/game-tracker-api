require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @game = games(:one)
  end

  test "should get index" do
    get user_games_url(@user), as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post user_games_url(@user), params: { game: { owned: @game.owned, platform: @game.platform, title: @game.title, user_id: @game.user_id} }, as: :json
    end

    assert_response :created
  end

  test "should show game" do
    get user_game_url(@user, @game), as: :json
    assert_response :success
  end

  test "should update game" do
    patch user_game_url(@user, @game), params: { game: { owned: @game.owned, platform: @game.platform, title: @game.title, user_id: @user.id } }, as: :json
    assert_response :success
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete user_game_url(@user, @game), as: :json
    end

    assert_response :no_content
  end
end
