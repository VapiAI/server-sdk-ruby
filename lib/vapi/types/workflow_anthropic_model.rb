# frozen_string_literal: true

module Vapi
  module Types
    # Workflow model configuration for Anthropic, including model selection, thinking, temperature, and maximum output
    # tokens.
    class WorkflowAnthropicModel < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false
      field :model, -> { Vapi::Types::WorkflowAnthropicModelModel }, optional: false, nullable: false
      field :thinking, -> { Vapi::Types::AnthropicThinkingConfig }, optional: true, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
    end
  end
end
