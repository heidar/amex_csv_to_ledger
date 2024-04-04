# frozen_string_literal: true

require 'test_helper'

module AmexCsvToLedger
  class TestLedgerOutgoingLine < Minitest::Test
    def test_output
      line = LedgerOutgoingLine.new
      assert_equal('    liabilities:creditcard:amex', line.output)
    end

    def test_output_with_tabs
      Config.stub(:new, config_mock) do
        line = LedgerOutgoingLine.new
        assert_equal("\tliabilities:creditcard:amex", line.output)
      end
    end

    private

    def config_mock
      mock = Minitest::Mock.new
      def mock.use_tabs?
        true
      end

      mock
    end
  end
end
