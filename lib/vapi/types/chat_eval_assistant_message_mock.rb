# frozen_string_literal: true

module Vapi
  module Types
    class ChatEvalAssistantMessageMock < Internal::Types::Model
      field :role, -> { Vapi::Types::ChatEvalAssistantMessageMockRole }, optional: false, nullable: false
      field :content, -> { String }, optional: true, nullable: false
      field :tool_calls, -> { Internal::Types::Array[Vapi::Types::ChatEvalAssistantMessageMockToolCall] }, optional: true, nullable: false, api_name: "toolCalls"
    end
  end
end
