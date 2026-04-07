# frozen_string_literal: true

module Vapi
  module Types
    class AssistantMessageEvaluationContinuePlan < Internal::Types::Model
      field :exit_on_failure_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "exitOnFailureEnabled"
      field :content_override, -> { String }, optional: true, nullable: false, api_name: "contentOverride"
      field :tool_calls_override, -> { Internal::Types::Array[Vapi::Types::ChatEvalAssistantMessageMockToolCall] }, optional: true, nullable: false, api_name: "toolCallsOverride"
    end
  end
end
