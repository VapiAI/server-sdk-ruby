# frozen_string_literal: true

module Vapi
  module Types
    # Evaluates assistant-message content and tool-call arguments using regular-expression patterns.
    class AssistantMessageJudgePlanRegex < Internal::Types::Model
      field :content, -> { String }, optional: false, nullable: false
      field :tool_calls, -> { Internal::Types::Array[Vapi::Types::ChatEvalAssistantMessageMockToolCall] }, optional: true, nullable: false, api_name: "toolCalls"
    end
  end
end
