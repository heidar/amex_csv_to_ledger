# frozen_string_literal: true

module AmexCsvToLedger
  # Class to format ledger expense lines with a currency amount.
  class LedgerExpenseLine
    DEFAULT_INDENT_LENGTH = 4
    DEFAULT_SPACING = 42
    DEFAULT_PLACEHOLDER = 'expenses:placeholder'
    TAB_LENGTH = 8

    attr_reader :amount

    def initialize(amount:)
      @amount = amount
    end

    def output
      "#{indent}#{placeholder}#{spaces}#{amount} #{currency}"
    end

    private

    def indent
      if use_tabs?
        "\t"
      else
        ' ' * DEFAULT_INDENT_LENGTH
      end
    end

    def placeholder
      DEFAULT_PLACEHOLDER
    end

    def spaces
      ' ' * spacing
    end

    def spacing
      if use_tabs?
        DEFAULT_SPACING - TAB_LENGTH - @amount.length
      else
        DEFAULT_SPACING - DEFAULT_INDENT_LENGTH - @amount.length
      end
    end

    def currency
      'GBP'
    end

    def use_tabs?
      AmexCsvToLedger.config.use_tabs?
    end
  end
end
