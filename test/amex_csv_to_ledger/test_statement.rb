# frozen_string_literal: true

require 'test_helper'

class TestStatement < Minitest::Test
  def setup
    @csv = File.read('test/fixtures/amex.csv')
    @statement = Statement.new(@csv)
  end

  def test_lines_size
    assert_equal(3, @statement.lines.size)
  end

  def test_lines_type
    assert_equal(StatementLine, @statement.lines.first.class)
  end
end
