# frozen_string_literal: true

module Vapi
  module Types
    class JsonQueryOnEventsTableFiltersItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::EventsTableStringCondition }
      member -> { Vapi::Types::EventsTableNumberCondition }
      member -> { Vapi::Types::EventsTableBooleanCondition }
    end
  end
end
