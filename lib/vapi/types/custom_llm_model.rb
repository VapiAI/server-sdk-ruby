# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for generating assistant responses through a custom language model endpoint, including server URL,
    # headers, metadata, prompts, tools, and generation settings.
    class CustomLlmModel < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false
      field :tools, -> { Internal::Types::Array[Vapi::Types::CustomLlmModelToolsItem] }, optional: true, nullable: false
      field :tool_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "toolIds"
      field :tool_refs, -> { Internal::Types::Array[Vapi::Types::ToolRef] }, optional: true, nullable: false, api_name: "toolRefs"
      field :knowledge_base, -> { Vapi::Types::CreateCustomKnowledgeBaseDto }, optional: true, nullable: false, api_name: "knowledgeBase"
      field :metadata_send_mode, -> { Vapi::Types::CustomLlmModelMetadataSendMode }, optional: true, nullable: false, api_name: "metadataSendMode"
      field :headers, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :word_level_confidence_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "wordLevelConfidenceEnabled"
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :model, -> { String }, optional: false, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
      field :emotion_recognition_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "emotionRecognitionEnabled"
      field :num_fast_turns, -> { Integer }, optional: true, nullable: false, api_name: "numFastTurns"
    end
  end
end
