# frozen_string_literal: true

module Vapi
  module Types
    # These are the options for the assistant's LLM.
    class AssistantModel < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::AnthropicModel }, key: "ANTHROPIC"
      member -> { Vapi::Types::AnthropicBedrockModel }, key: "ANTHROPIC_BEDROCK"
      member -> { Vapi::Types::AnyscaleModel }, key: "ANYSCALE"
      member -> { Vapi::Types::CerebrasModel }, key: "CEREBRAS"
      member -> { Vapi::Types::CustomLlmModel }, key: "CUSTOM_LLM"
      member -> { Vapi::Types::DeepInfraModel }, key: "DEEPINFRA"
      member -> { Vapi::Types::DeepSeekModel }, key: "DEEP_SEEK"
      member -> { Vapi::Types::GoogleModel }, key: "GOOGLE"
      member -> { Vapi::Types::GroqModel }, key: "GROQ"
      member -> { Vapi::Types::InflectionAiModel }, key: "INFLECTION_AI"
      member -> { Vapi::Types::MinimaxLlmModel }, key: "MINIMAX"
      member -> { Vapi::Types::OpenAiModel }, key: "OPENAI"
      member -> { Vapi::Types::OpenRouterModel }, key: "OPENROUTER"
      member -> { Vapi::Types::PerplexityAiModel }, key: "PERPLEXITY_AI"
      member -> { Vapi::Types::TogetherAiModel }, key: "TOGETHER_AI"
      member -> { Vapi::Types::XaiModel }, key: "XAI"
    end
  end
end
