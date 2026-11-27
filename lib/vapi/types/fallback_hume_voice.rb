# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for synthesizing assistant speech with Hume, including model and voice selection, custom
    # voice metadata, chunking, and caching.
    class FallbackHumeVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :model, -> { Vapi::Types::FallbackHumeVoiceModel }, optional: true, nullable: false
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :is_custom_hume_voice, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isCustomHumeVoice"
      field :description, -> { String }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
