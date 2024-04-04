# frozen_string_literal: true

module AmexCsvToLedger
  # Class to format ledger outgoing lines.
  class LedgerOutgoingLine
    DEFAULT_INDENT_LENGTH = 4
    DEFAULT_OUTGOING_ACCOUNT = 'liabilities:creditcard:amex'

    def output
      "#{indent}#{outgoing_account}"
    end

    private

    def indent
      ' ' * DEFAULT_INDENT_LENGTH
    end

    def outgoing_account
      DEFAULT_OUTGOING_ACCOUNT
    end
  end
end
