# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for synthesizing assistant speech with Inworld, including voice and model selection, language,
    # temperature, speaking rate, chunking, caching, and fallback settings.
    class InworldVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::InworldVoiceVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::InworldVoiceModel }, optional: true, nullable: false
      field :language_code, -> { Vapi::Types::InworldVoiceLanguageCode }, optional: true, nullable: false, api_name: "languageCode"
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :speaking_rate, -> { Integer }, optional: true, nullable: false, api_name: "speakingRate"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
