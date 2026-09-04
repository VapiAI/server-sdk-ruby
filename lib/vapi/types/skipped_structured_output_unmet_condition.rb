# frozen_string_literal: true

module Vapi
  module Types
    # This is the first condition that was not met. Conditions use AND semantics, so
    # evaluation stops as soon as one condition does not pass.
    class SkippedStructuredOutputUnmetCondition < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::MinMessagesCondition }, key: "MIN_MESSAGES"
      member -> { Vapi::Types::MinCallDurationCondition }, key: "MIN_CALL_DURATION"
      member -> { Vapi::Types::EndedReasonCondition }, key: "ENDED_REASON"
    end
  end
end
