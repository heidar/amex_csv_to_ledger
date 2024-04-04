# frozen_string_literal: true

module AmexCsvToLedger
  # A class to glue together all the ledger lines to create a full report.
  class LedgerReport
    attr_reader :statement

    def initialize(statement)
      @statement = statement
    end

    def lines
      statement.lines.map do |line|
        [
          date_line(line),
          expense_line(line),
          outgoing_line
        ].join("\n")
      end
    end

    private

    def date_line(line)
      LedgerDateLine.new(
        date: line.date,
        description: line.description
      ).output
    end

    def expense_line(line)
      LedgerExpenseLine.new(amount: line.amount).output
    end

    def outgoing_line
      LedgerOutgoingLine.new.output
    end
  end
end
