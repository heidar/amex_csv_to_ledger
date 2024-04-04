# frozen_string_literal: true

module AmexCsvToLedger
  # Class to format ledger outgoing lines.
  class LedgerOutgoingLine
    DEFAULT_OUTGOING_ACCOUNT = 'liabilities:creditcard:amex'
    TAB_LENGTH = 8

    def output
      "#{indent}#{outgoing_account}"
    end

    private

    def indent
      if use_tabs?
        "\t"
      else
        ' ' * indent_size
      end
    end

    def outgoing_account
      DEFAULT_OUTGOING_ACCOUNT
    end

    def use_tabs?
      AmexCsvToLedger.config.use_tabs?
    end

    def indent_size
      AmexCsvToLedger.config.indent_size
    end
  end
end
