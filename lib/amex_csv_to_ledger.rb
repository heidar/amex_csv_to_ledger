# frozen_string_literal: true

require_relative 'amex_csv_to_ledger/version'
require_relative 'amex_csv_to_ledger/statement'
require_relative 'amex_csv_to_ledger/statement_line'

# Top level class for the converter which glues together all of the code.
class AmexCsvToLedger
  def self.convert(csv_path)
    csv = File.open(csv_path)
    statement = Statement.new(csv)
  end
end
