# frozen_string_literal: true

require 'test_helper'

class TestStatementLine < Minitest::Test
  def setup
    @line = StatementLine.new(
      amount: 5.50,
      date: '15/06/2022',
      description: 'foo bar.'
    )
  end

  def test_amount
    assert_in_delta(5.50, @line.amount)
  end

  def test_date
    assert_equal('2022-06-15', @line.date)
  end

  def test_description
    assert_equal('foo bar.', @line.description)
  end
end
