# frozen_string_literal: true

require 'test_helper'

module AmexCsvToLedger
  class TestConfig < Minitest::Test
    def setup
      @config = Config.new('test/fixtures/config.yml')
      @empty_config = Config.new('foo')
    end

    def test_date_format
      assert_equal('%d/%m/%Y', @config.date_format)
    end

    def test_date_format_default
      assert_equal('%Y-%m-%d', @empty_config.date_format)
    end

    def test_use_tabs
      assert_predicate(@config, :use_tabs?)
    end

    def test_use_tabs_default
      refute_predicate(@empty_config, :use_tabs?)
    end

    def test_indent_size
      assert_equal(2, @config.indent_size)
    end

    def test_indent_size_default
      assert_equal(4, @empty_config.indent_size)
    end

    def test_expense_placeholder
      assert_equal('Expenses:Placeholder', @config.expense_placeholder)
    end

    def test_expense_placeholder_default
      assert_equal('expenses:placeholder', @empty_config.expense_placeholder)
    end

    def test_currency_prefixed
      assert_predicate(@config, :currency_prefixed?)
    end

    def test_currency_prefixed_default
      refute_predicate(@empty_config, :currency_prefixed?)
    end

    def test_currency
      assert_equal('$', @config.currency)
    end

    def test_currency_default
      assert_equal('GBP', @empty_config.currency)
    end
  end
end
