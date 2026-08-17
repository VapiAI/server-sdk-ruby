# frozen_string_literal: true

module Vapi
  module Types
    # OpenAI model configuration for an LLM judge, including its messages and generation settings.
    class EvalOpenAiModel < Internal::Types::Model
      field :model, -> { Vapi::Types::EvalOpenAiModelModel }, optional: false, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
      field :messages, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
    end
  end
end
