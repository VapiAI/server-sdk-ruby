# frozen_string_literal: true

module Vapi
  # This is the operator to use for the filter.
  #  For date type columns, the operator must be "=", ">", "<", ">=", "<="
  class FilterDateTypeColumnOnCallTableOperator
    EQUAL_TO = "="
    NOT_EQUALS = "!="
    GREATER_THAN = ">"
    LESS_THAN = "<"
    GREATER_THAN_OR_EQUAL_TO = ">="
    LESS_THAN_OR_EQUAL_TO = "<="
  end
end
