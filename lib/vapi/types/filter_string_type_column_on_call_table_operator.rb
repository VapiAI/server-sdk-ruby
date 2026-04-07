# frozen_string_literal: true

module Vapi
  module Types
    module FilterStringTypeColumnOnCallTableOperator
      extend Vapi::Internal::Types::Enum

      EQUAL_TO = "="
      NOT_EQUALS = "!="
      CONTAINS = "contains"
      NOT_CONTAINS = "not_contains"
    end
  end
end
