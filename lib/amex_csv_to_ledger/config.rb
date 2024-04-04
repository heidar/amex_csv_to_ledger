# frozen_string_literal: true

require 'yaml'

module AmexCsvToLedger
  # Class to load and parse the config file.
  class Config
    DEFAULT_PATH = '~/.config/amex_csv_to_ledger/config.yml'

    def initialize(path = DEFAULT_PATH)
      @config = YAML.load_file(File.expand_path(path))
    rescue StandardError
      @config = {}
    end

    def date_format
      @config.fetch('date_format', '%Y-%m-%d')
    end

    def use_tabs?
      @config.fetch('use_tabs', false)
    end

    def indent_size
      @config.fetch('indent_size', 4)
    end

    def expense_placeholder
      @config.fetch('expense_placeholder', 'expenses:placeholder')
    end
  end
end
