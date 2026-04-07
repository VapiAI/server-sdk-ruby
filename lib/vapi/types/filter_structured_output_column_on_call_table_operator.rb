# frozen_string_literal: true

module Vapi
  module Types
    module FilterStructuredOutputColumnOnCallTableOperator
      extend Vapi::Internal::Types::Enum

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
      IS_EMPTY = "is_empty"
      IS_NOT_EMPTY = "is_not_empty"
    end
  end
end
