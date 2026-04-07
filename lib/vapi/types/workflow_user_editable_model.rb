# frozen_string_literal: true

module Vapi
  module Types
    # This is the model for the workflow.
    #
    # This can be overridden at node level using `nodes[n].model`.
    class WorkflowUserEditableModel < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::WorkflowOpenAiModel }, key: "OPENAI"
      member -> { Vapi::Types::WorkflowAnthropicModel }, key: "ANTHROPIC"
      member -> { Vapi::Types::WorkflowAnthropicBedrockModel }, key: "ANTHROPIC_BEDROCK"
      member -> { Vapi::Types::WorkflowGoogleModel }, key: "GOOGLE"
      member -> { Vapi::Types::WorkflowCustomModel }, key: "CUSTOM_LLM"
    end
  end
end
