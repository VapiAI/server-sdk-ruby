# frozen_string_literal: true

module Vapi
  # This is the operator you want to use to compare the left side and right side.
  #  The operation becomes `(leftSide) operator (rightSide)`.
  class RuleBasedConditionOperator
    EQ = "eq"
    NEQ = "neq"
    GT = "gt"
    GTE = "gte"
    LT = "lt"
    LTE = "lte"
  end
end
