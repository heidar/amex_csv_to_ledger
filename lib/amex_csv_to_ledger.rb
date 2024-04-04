# frozen_string_literal: true

require_relative 'amex_csv_to_ledger/version'
require_relative 'amex_csv_to_ledger/ledger_date_line'
require_relative 'amex_csv_to_ledger/ledger_expense_line'
require_relative 'amex_csv_to_ledger/ledger_outgoing_line'
require_relative 'amex_csv_to_ledger/statement'
require_relative 'amex_csv_to_ledger/statement_line'

# Top level class for the converter which glues together all of the code.
module AmexCsvToLedger
  def self.convert(csv_path)
    csv = File.open(csv_path)
    statement = Statement.new(csv)
    puts(LedgerDateLine.new(
      date: statement.lines.first.date,
      description: statement.lines.first.description
    ).output)
    puts LedgerExpenseLine.new(amount: statement.lines.first.amount).output
    puts LedgerOutgoingLine.new.output
  end
end
