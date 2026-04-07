# frozen_string_literal: true

module Vapi
  module Types
    # This is the expected value that was defined in the evaluation plan.
    class StructuredOutputEvaluationResultExpectedValue < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Integer }
      member -> { String }
      member -> { Internal::Types::Boolean }
    end
  end
end
