# frozen_string_literal: true

module AmexCsvToLedger
  # Class to format ledger date lines with a description.
  class LedgerDateLine
    def initialize(date:, description:)
      @date = date
      @description = description
    end

    def output
      "#{@date} #{@description}"
    end
  end
end
