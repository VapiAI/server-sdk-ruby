# frozen_string_literal: true

module Vapi
  # This is the operator to use for the filter.
  #  For string type columns, the operator must be "=", "!=", "contains", "not
  #  contains"
  class FilterStringTypeColumnOnCallTableOperator
    EQUAL_TO = "="
    NOT_EQUALS = "!="
    CONTAINS = "contains"
    NOT_CONTAINS = "not_contains"
  end
end
