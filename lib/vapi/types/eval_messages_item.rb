# frozen_string_literal: true

module Vapi
  module Types
    class EvalMessagesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::ChatEvalAssistantMessageMock }
      member -> { Vapi::Types::ChatEvalSystemMessageMock }
      member -> { Vapi::Types::ChatEvalToolResponseMessageMock }
      member -> { Vapi::Types::ChatEvalToolResponseMessageEvaluation }
      member -> { Vapi::Types::ChatEvalUserMessageMock }
      member -> { Vapi::Types::ChatEvalAssistantMessageEvaluation }
    end
  end
end
