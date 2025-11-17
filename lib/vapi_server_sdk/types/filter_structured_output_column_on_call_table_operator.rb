# frozen_string_literal: true

module Vapi
  # This is the operator to use for the filter.
  #  The operator depends on the value type of the structured output.
  #  If the structured output is a string or boolean, the operator must be "=", "!="
  #  If the structured output is a number, the operator must be "=", ">", "<", ">=",
  #  "<="
  #  If the structured output is an array, the operator must be "in" or "not_in"
  class FilterStructuredOutputColumnOnCallTableOperator
    EQUAL_TO = "="
    NOT_EQUALS = "!="
    GREATER_THAN = ">"
    LESS_THAN = "<"
    GREATER_THAN_OR_EQUAL_TO = ">="
    LESS_THAN_OR_EQUAL_TO = "<="
    IN = "in"
    NOT_IN = "not_in"
    CONTAINS = "contains"
    NOT_CONTAINS = "not_contains"
  end
end
