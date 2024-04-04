# frozen_string_literal: true

require 'test_helper'

module AmexCsvToLedger
  class TestLedgerOutgoingLine < Minitest::Test
    def test_output
      line = LedgerOutgoingLine.new
      assert_equal('    liabilities:creditcard:amex', line.output)
    end

    def test_output_with_tabs
      Config.stub(:new, use_tabs_config_mock) do
        line = LedgerOutgoingLine.new
        assert_equal("\tliabilities:creditcard:amex", line.output)
      end
    end

    def test_output_with_different_indent_size
      Config.stub(:new, different_indent_size_config_mock) do
        line = LedgerOutgoingLine.new
        assert_equal('  liabilities:creditcard:amex', line.output)
      end
    end

    private

    def use_tabs_config_mock
      mock = Minitest::Mock.new
      def mock.use_tabs?
        true
      end

      mock
    end

    def different_indent_size_config_mock
      mock = Minitest::Mock.new
      def mock.use_tabs?
        false
      end

      def mock.indent_size
        2
      end

      mock
    end
  end
end
