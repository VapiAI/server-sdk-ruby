# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiModel < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false
      field :tools, -> { Internal::Types::Array[Vapi::Types::OpenAiModelToolsItem] }, optional: true, nullable: false
      field :tool_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "toolIds"
      field :knowledge_base, -> { Vapi::Types::CreateCustomKnowledgeBaseDto }, optional: true, nullable: false, api_name: "knowledgeBase"
      field :model, -> { Vapi::Types::OpenAiModelModel }, optional: false, nullable: false
      field :fallback_models, -> { Internal::Types::Array[Vapi::Types::OpenAiModelFallbackModelsItem] }, optional: true, nullable: false, api_name: "fallbackModels"
      field :tool_strict_compatibility_mode, -> { Vapi::Types::OpenAiModelToolStrictCompatibilityMode }, optional: true, nullable: false, api_name: "toolStrictCompatibilityMode"
      field :prompt_cache_retention, -> { Vapi::Types::OpenAiModelPromptCacheRetention }, optional: true, nullable: false, api_name: "promptCacheRetention"
      field :prompt_cache_key, -> { String }, optional: true, nullable: false, api_name: "promptCacheKey"
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
      field :emotion_recognition_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "emotionRecognitionEnabled"
      field :num_fast_turns, -> { Integer }, optional: true, nullable: false, api_name: "numFastTurns"
    end
  end
end
