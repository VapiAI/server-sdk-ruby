# frozen_string_literal: true

module Vapi
  # This is the aggregation operation to perform on the column.
  #  When the column is a number type, the operation must be one of the following:
  #  - average
  #  - sum
  #  - min
  #  - max
  class JsonQueryOnCallTableWithNumberTypeColumnOperation
    AVERAGE = "average"
    SUM = "sum"
    MIN = "min"
    MAX = "max"
  end
end
