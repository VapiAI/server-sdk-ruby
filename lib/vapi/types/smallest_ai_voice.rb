# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for synthesizing assistant speech with Smallest AI, including voice and model selection, speed,
    # chunking, caching, and fallback settings.
    class SmallestAiVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::SmallestAiVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::SmallestAiVoiceModel }, optional: true, nullable: false
      field :speed, -> { Integer }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
