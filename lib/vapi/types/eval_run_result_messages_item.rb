# frozen_string_literal: true

module Vapi
  module Types
    class EvalRunResultMessagesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :role

      member -> { Vapi::Types::ChatEvalUserMessageMock }, key: "USER"
      member -> { Vapi::Types::ChatEvalSystemMessageMock }, key: "SYSTEM"
      member -> { Vapi::Types::ChatEvalToolResponseMessageMock }, key: "TOOL"
      member -> { Vapi::Types::ChatEvalAssistantMessageMock }, key: "ASSISTANT"
    end
  end
end
