# frozen_string_literal: true

module Vapi
  module Types
    class UpdateBarInsightFromCallTableDtoQueriesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::JsonQueryOnCallTableWithStringTypeColumn }
      member -> { Vapi::Types::JsonQueryOnCallTableWithNumberTypeColumn }
      member -> { Vapi::Types::JsonQueryOnCallTableWithStructuredOutputColumn }
      member -> { Vapi::Types::JsonQueryOnEventsTable }
    end
  end
end
