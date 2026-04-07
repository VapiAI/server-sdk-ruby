# frozen_string_literal: true

module Vapi
  module Types
    class JsonQueryOnCallTableWithStringTypeColumnFiltersItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::FilterStringTypeColumnOnCallTable }
      member -> { Vapi::Types::FilterStringArrayTypeColumnOnCallTable }
      member -> { Vapi::Types::FilterNumberTypeColumnOnCallTable }
      member -> { Vapi::Types::FilterNumberArrayTypeColumnOnCallTable }
      member -> { Vapi::Types::FilterDateTypeColumnOnCallTable }
      member -> { Vapi::Types::FilterStructuredOutputColumnOnCallTable }
    end
  end
end
