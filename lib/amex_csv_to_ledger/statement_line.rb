# frozen_string_literal: true

require 'date'

module AmexCsvToLedger
  # Class to hold the data found in a line of an AMEX statement.
  class StatementLine
    attr_reader :amount, :description

    AMEX_DATE_FORMAT = '%Y/%m/%d'

    def initialize(amount:, date:, description:)
      @amount = amount
      @date   = date
      @description = description
    end

    def date
      parsed_date.strftime('%Y-%m-%d')
    end

    private

    def parsed_date
      Date.parse(@date, AMEX_DATE_FORMAT)
    end
  end
end
