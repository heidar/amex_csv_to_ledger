# frozen_string_literal: true

require 'test_helper'

module AmexCsvToLedger
  class TestLedgerOutgoingLine < Minitest::Test
    def setup
      @line = LedgerOutgoingLine.new
    end

    def test_output
      assert_equal('    liabilities:creditcard:amex', @line.output)
    end
  end
end
