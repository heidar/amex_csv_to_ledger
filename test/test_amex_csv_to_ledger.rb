# frozen_string_literal: true

require 'test_helper'

module AmexCsvToLedger
  class TestAmexCsvToLedger < Minitest::Test
    def setup
      @csv_path = 'test/fixtures/amex.csv'
      @original_stdout = $stdout.dup
      @report_path = 'tmp/report.ledger'
      $stdout.reopen(@report_path, 'w')
      $stdout.sync = true
    end

    def teardown
      $stdout.reopen(@original_stdout)
      File.delete(@report_path)
    end

    def test_printout
      AmexCsvToLedger.convert(@csv_path)
      generated_report = File.read(@report_path)
      fixture_report = File.read('test/fixtures/report.ledger')

      assert_equal(fixture_report, generated_report)
    end
  end
end
