# frozen_string_literal: true

require 'date'

module AmexCsvToLedger
  # Class to format ledger date lines with a description.
  class LedgerDateLine
    AMEX_DATE_FORMAT = '%Y/%m/%d'

    attr_reader :description

    def initialize(date:, description:)
      @date = date
      @description = description
    end

    def output
      "#{date} #{description}"
    end

    private

    def date
      parsed_date.strftime(date_format)
    end

    def parsed_date
      Date.parse(@date, AMEX_DATE_FORMAT)
    end

    def date_format
      AmexCsvToLedger.config.date_format
    end
  end
end
