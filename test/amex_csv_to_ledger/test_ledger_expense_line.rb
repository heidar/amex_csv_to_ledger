# frozen_string_literal: true

require 'test_helper'

module AmexCsvToLedger
  class TestLedgerExpenseLine < Minitest::Test
    def test_output
      line = LedgerExpenseLine.new(amount: '13.37')
      assert_equal(
        '    expenses:placeholder                                 13.37 GBP',
        line.output
      )
    end

    def test_output_with_shorter_amount
      line = LedgerExpenseLine.new(amount: '3.37')
      assert_equal(
        '    expenses:placeholder                                  3.37 GBP',
        line.output
      )
    end

    def test_output_with_longer_amount
      line = LedgerExpenseLine.new(amount: '133.37')
      assert_equal(
        '    expenses:placeholder                                133.37 GBP',
        line.output
      )
    end

    def test_output_with_tabs
      Config.stub(:new, use_tabs_config_mock) do
        line = LedgerExpenseLine.new(amount: '13.37')
        assert_equal(
          "\texpenses:placeholder                             13.37 GBP",
          line.output
        )
      end
    end

    def test_output_with_different_indent_size
      Config.stub(:new, different_indent_size_config_mock) do
        line = LedgerExpenseLine.new(amount: '13.37')
        assert_equal(
          '  expenses:placeholder                                   13.37 GBP',
          line.output
        )
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
