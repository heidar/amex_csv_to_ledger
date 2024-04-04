# frozen_string_literal: true

require 'test_helper'

module AmexCsvToLedger
  class TestLedgerReport < Minitest::Test
    def setup
      csv = File.read('test/fixtures/amex.csv')
      statement = Statement.new(csv)
      report = LedgerReport.new(statement)
      @lines = report.lines[0].split("\n")
    end

    def test_date_line
      assert_equal(
        '2022-07-22 DELIVEROO               LONDON',
        @lines[0]
      )
    end

    def test_expense_line
      assert_equal(
        '    expenses:placeholder                                 13.37 GBP',
        @lines[1]
      )
    end

    def test_outgoing_line
      assert_equal(
        '    liabilities:creditcard:amex',
        @lines[2]
      )
    end
  end
end
