# frozen_string_literal: true

module Vapi
  module Types
    # This is the expected value to compare against the extracted structured output result.
    # Type should match the structured output's schema type.
    class EvaluationPlanItemValue < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Integer }
      member -> { String }
      member -> { Internal::Types::Boolean }
    end
  end
end
