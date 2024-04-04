# frozen_string_literal: true

module AmexCsvToLedger
  # Class to format ledger expense lines with a currency amount.
  class LedgerExpenseLine
    DEFAULT_SPACING = 62 # spacing used by LedgerAlignBuffer
    TAB_LENGTH = 8

    attr_reader :amount

    def initialize(amount:)
      @amount = amount
    end

    def output
      "#{indent}#{placeholder}#{spaces}#{formatted_amount}"
    end

    private

    def indent
      if use_tabs?
        "\t"
      else
        ' ' * indent_size
      end
    end

    def placeholder
      AmexCsvToLedger.config.expense_placeholder
    end

    def spaces
      ' ' * spacing
    end

    def spacing
      len = DEFAULT_SPACING - indent_size - placeholder.length - amount.length

      if currency_prefixed?
        len - currency.length
      else
        len
      end
    end

    def currency
      'GBP'
    end

    def use_tabs?
      AmexCsvToLedger.config.use_tabs?
    end

    def indent_size
      if use_tabs?
        TAB_LENGTH
      else
        AmexCsvToLedger.config.indent_size
      end
    end

    def currency_prefixed?
      AmexCsvToLedger.config.currency_prefixed?
    end

    def formatted_amount
      if currency_prefixed?
        "#{currency}#{amount}"
      else
        "#{amount} #{currency}"
      end
    end
  end
end
