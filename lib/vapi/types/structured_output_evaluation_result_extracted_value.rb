# frozen_string_literal: true

module Vapi
  module Types
    # This is the value extracted from the call by the structured output.
    class StructuredOutputEvaluationResultExtractedValue < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Integer }
      member -> { String }
      member -> { Internal::Types::Boolean }
    end
  end
end
