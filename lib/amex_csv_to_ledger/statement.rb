# frozen_string_literal: true

require 'csv'

# Class to hold the data found in an AMEX statement.
class Statement
  def initialize(csv)
    @csv = csv
  end

  def lines
    CSV.parse(@csv, headers: true).map do |row|
      StatementLine.new(
        amount: row['Amount'],
        date: row['Date'],
        description: row['Description']
      )
    end
  end
end
