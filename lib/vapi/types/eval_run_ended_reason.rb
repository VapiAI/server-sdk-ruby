# frozen_string_literal: true

module Vapi
  module Types
    module EvalRunEndedReason
      extend Vapi::Internal::Types::Enum

      MOCK_CONVERSATION_DONE = "mockConversation.done"
      ERROR = "error"
      TIMEOUT = "timeout"
      CANCELLED = "cancelled"
      ABORTED = "aborted"
    end
  end
end
