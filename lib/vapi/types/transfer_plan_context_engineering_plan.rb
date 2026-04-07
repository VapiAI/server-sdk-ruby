# frozen_string_literal: true

module Vapi
  module Types
    # This is the plan for manipulating the message context before initiating the warm transfer.
    # Usage:
    # - Used only when `mode` is `warm-transfer-experimental`.
    # - These messages will automatically be added to the transferAssistant's system message.
    # - If 'none', we will not add any transcript to the transferAssistant's system message.
    # - If you want to provide your own messages, use transferAssistant.model.messages instead.
    #
    # @default { type: 'all' }
    class TransferPlanContextEngineeringPlan < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::ContextEngineeringPlanLastNMessages }, key: "LAST_N_MESSAGES"
      member -> { Vapi::Types::ContextEngineeringPlanNone }, key: "NONE"
      member -> { Vapi::Types::ContextEngineeringPlanAll }, key: "ALL"
    end
  end
end
