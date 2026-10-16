# frozen_string_literal: true

module Vapi
  module StructuredOutputs
    module Types
      class UpdateStructuredOutputDtoConditionsItem < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :type

        member -> { Vapi::Types::MinMessagesCondition }, key: "MIN_MESSAGES"
        member -> { Vapi::Types::MinCallDurationCondition }, key: "MIN_CALL_DURATION"
        member -> { Vapi::Types::EndedReasonCondition }, key: "ENDED_REASON"
      end
    end
  end
end
