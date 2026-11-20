# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for synthesizing assistant speech with Sesame, including voice and model selection,
    # chunking, and caching.
    class FallbackSesameVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::FallbackSesameVoiceModel }, optional: false, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
