# frozen_string_literal: true

require 'csv'

module AmexCsvToLedger
  # Class to hold the data found in an AMEX statement.
  class Statement
    attr_reader :csv

    def initialize(csv)
      @csv = csv
    end

    def lines
      @lines ||= CSV.parse(csv, headers: true).map do |row|
        StatementLine.new(
          amount: row['Amount'],
          date: row['Date'],
          description: row['Description']
        )
      end
    end
  end
end
