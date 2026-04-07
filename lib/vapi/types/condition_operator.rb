# frozen_string_literal: true

module Vapi
  module Types
    module ConditionOperator
      extend Vapi::Internal::Types::Enum

      EQ = "eq"
      NEQ = "neq"
      GT = "gt"
      GTE = "gte"
      LT = "lt"
      LTE = "lte"
    end
  end
end
