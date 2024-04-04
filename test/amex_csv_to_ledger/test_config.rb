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
  end
end
