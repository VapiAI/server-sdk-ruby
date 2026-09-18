# frozen_string_literal: true

module Vapi
  module Types
    # The expected value the structured output is compared against. Its type should match the structured output's type,
    # for example `true` for a boolean.
    class EvaluationPlanItemValue < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Integer }
      member -> { String }
      member -> { Internal::Types::Boolean }
    end
  end
end
