# frozen_string_literal: true

require 'test_helper'

module AmexCsvToLedger
  class TestLedgerDateLine < Minitest::Test
    def setup
      @line = LedgerDateLine.new(
        date: '2022-06-15',
        description: 'foo bar.'
      )
    end

    def test_output
      assert_equal('2022-06-15 foo bar.', @line.output)
    end
  end
end
