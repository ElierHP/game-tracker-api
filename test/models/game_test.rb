require "test_helper"

class GameTest < ActiveSupport::TestCase
  setup do
    @game = games(:one)
  end

  test "title should be valid" do
    @game.title = ""
    assert_not @game.valid?
    @game.title = "x" * 41
    assert_not @game.valid?
    @game.title = "x"
    assert_not @game.valid?
  end

  test "owned should be a boolean" do
    @game.owned = nil
    assert_not @game.valid?
  end

  test "platform should be valid" do
    @game.platform = ""
    assert_not @game.valid?
    @game.platform = "x" * 41
    assert_not @game.valid?
    @game.platform = "x"
    assert_not @game.valid?
  end
end
