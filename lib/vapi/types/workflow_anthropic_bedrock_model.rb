# frozen_string_literal: true

module Vapi
  module Types
    class WorkflowAnthropicBedrockModel < Internal::Types::Model
      field :model, -> { Vapi::Types::WorkflowAnthropicBedrockModelModel }, optional: false, nullable: false
      field :thinking, -> { Vapi::Types::AnthropicThinkingConfig }, optional: true, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
    end
  end
end
