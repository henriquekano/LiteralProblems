require_relative "LiteralString"
require "minitest/autorun"

class TestLiteralString < Minitest::Test

  def test_plus
    assert_equal("2.0a", LiteralString.new("a")+"a")
    assert_equal("3.0a", LiteralString.new("2a")+"a")
    assert_equal("b+a", LiteralString.new("b")+"a")
    assert_equal("ab+a", LiteralString.new("ab")+"a")
    assert_equal("a^2+a", LiteralString.new("a^2")+"a")
    assert_equal("a^2b^2+a", LiteralString.new("a^2b^2")+"a")
    assert_equal("abc^2+abc", LiteralString.new("abc^2")+"abc")
    assert_equal("2.0abc^2", LiteralString.new("abc^2")+"abc^2")
  end

end