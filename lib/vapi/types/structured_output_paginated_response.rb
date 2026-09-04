# frozen_string_literal: true

module Vapi
  module Types
    # A paginated collection of structured-output definitions and metadata describing the result set.
    class StructuredOutputPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::StructuredOutput] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
