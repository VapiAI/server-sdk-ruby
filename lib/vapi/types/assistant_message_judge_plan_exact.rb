# frozen_string_literal: true

module Vapi
  module Types
    # Evaluates an assistant message using case-insensitive exact content matching and expected tool calls.
    class AssistantMessageJudgePlanExact < Internal::Types::Model
      field :content, -> { String }, optional: false, nullable: false
      field :tool_calls, -> { Internal::Types::Array[Vapi::Types::ChatEvalAssistantMessageMockToolCall] }, optional: true, nullable: false, api_name: "toolCalls"
    end
  end
end
