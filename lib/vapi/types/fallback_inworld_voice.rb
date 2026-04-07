# frozen_string_literal: true

module Vapi
  module Types
    class FallbackInworldVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::FallbackInworldVoiceVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::FallbackInworldVoiceModel }, optional: true, nullable: false
      field :language_code, -> { Vapi::Types::FallbackInworldVoiceLanguageCode }, optional: true, nullable: false, api_name: "languageCode"
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :speaking_rate, -> { Integer }, optional: true, nullable: false, api_name: "speakingRate"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
