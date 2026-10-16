# frozen_string_literal: true

module Vapi
  module Types
    # Workflow model configuration for OpenAI, including model selection, temperature, and maximum output tokens.
    class WorkflowOpenAiModel < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false
      field :model, -> { Vapi::Types::WorkflowOpenAiModelModel }, optional: false, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
    end
  end
end
