# frozen_string_literal: true

module Vapi
  module Types
    module EventsTableStringConditionOperator
      extend Vapi::Internal::Types::Enum

      EQUAL_TO = "="
      NOT_EQUALS = "!="
      CONTAINS = "contains"
      NOT_CONTAINS = "notContains"
    end
  end
end
