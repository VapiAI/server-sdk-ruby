# frozen_string_literal: true

module Vapi
  module Types
    class DeepSeekModel < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false
      field :tools, -> { Internal::Types::Array[Vapi::Types::DeepSeekModelToolsItem] }, optional: true, nullable: false
      field :tool_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "toolIds"
      field :knowledge_base, -> { Vapi::Types::CreateCustomKnowledgeBaseDto }, optional: true, nullable: false, api_name: "knowledgeBase"
      field :model, -> { Vapi::Types::DeepSeekModelModel }, optional: false, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :max_tokens, -> { Integer }, optional: true, nullable: false, api_name: "maxTokens"
      field :emotion_recognition_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "emotionRecognitionEnabled"
      field :num_fast_turns, -> { Integer }, optional: true, nullable: false, api_name: "numFastTurns"
    end
  end
end
