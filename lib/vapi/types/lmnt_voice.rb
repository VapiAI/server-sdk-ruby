# frozen_string_literal: true

module Vapi
  module Types
    class LmntVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::LmntVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :speed, -> { Integer }, optional: true, nullable: false
      field :language, -> { Vapi::Types::LmntVoiceLanguage }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
