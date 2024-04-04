# frozen_string_literal: true

module AmexCsvToLedger
  # Class to format ledger expense lines with a currency amount.
  class LedgerExpenseLine
    DEFAULT_INDENT_LENGTH = 4
    DEFAULT_SPACING = 42
    DEFAULT_PLACEHOLDER = 'expenses:placeholder'

    attr_reader :amount

    def initialize(amount:)
      @amount = amount
    end

    def output
      "#{indent}#{placeholder}#{spaces}#{amount} #{currency}"
    end

    private

    def indent
      ' ' * DEFAULT_INDENT_LENGTH
    end

    def placeholder
      DEFAULT_PLACEHOLDER
    end

    def spaces
      ' ' * spacing
    end

    def spacing
      DEFAULT_SPACING - DEFAULT_INDENT_LENGTH - @amount.length
    end

    def currency
      'GBP'
    end
  end
end
