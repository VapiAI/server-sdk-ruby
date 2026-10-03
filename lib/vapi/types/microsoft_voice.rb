# frozen_string_literal: true

module Vapi
  module Types
    class MicrosoftVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::MicrosoftVoiceVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :style, -> { Vapi::Types::MicrosoftVoiceStyle }, optional: true, nullable: false
      field :style_degree, -> { Integer }, optional: true, nullable: false, api_name: "styleDegree"
      field :role, -> { Vapi::Types::MicrosoftVoiceRole }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :speed, -> { Integer }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
