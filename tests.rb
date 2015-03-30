require_relative "LiteralString"
require "minitest/autorun"

class TestLiteralString < Minitest::Test

  def test_general
    assert_equal("0", (LiteralString.new("a")-"a").to_s)
  end

  def test_plus
    assert_equal("2.0a", (LiteralString.new("a")+"a").to_s)
    assert_equal("3.0a", (LiteralString.new("2.0a")+"a").to_s)
    assert_equal("3.0a", (LiteralString.new("2a")+"a").to_s)
    assert_equal("b+a", (LiteralString.new("b")+"a").to_s)
    assert_equal("ab+a", (LiteralString.new("ab")+"a").to_s)
    assert_equal("a^2+a", (LiteralString.new("a^2")+"a").to_s)
    assert_equal("a^2b^2+a", (LiteralString.new("a^2b^2")+"a").to_s)
    assert_equal("abc^2+abc", (LiteralString.new("abc^2")+"abc").to_s)
    assert_equal("2.0abc^2", (LiteralString.new("abc^2")+"abc^2").to_s)
    assert_equal("a", (LiteralString.new("a")+"0").to_s)
    assert_equal("a-b", (LiteralString.new("a-b")+"0").to_s)
  end

  def test_minus
    assert_equal(LiteralString.new("0").to_s, (LiteralString.new("a")-"a").to_s)
    assert_equal("-1.0a", (LiteralString.new("a")-"2a").to_s)
  end

end