# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for synthesizing assistant speech with Azure, including voice selection, speed, chunking,
    # and caching.
    class FallbackAzureVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::FallbackAzureVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :speed, -> { Integer }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :one_of, -> { Object }, optional: true, nullable: false, api_name: "oneOf"
    end
  end
end
