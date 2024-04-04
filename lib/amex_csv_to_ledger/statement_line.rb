# frozen_string_literal: true

module AmexCsvToLedger
  # Class to hold the data found in a line of an AMEX statement.
  class StatementLine
    attr_reader :amount, :date, :description

    def initialize(amount:, date:, description:)
      @amount = amount
      @date   = date
      @description = description
    end
  end
end
