# frozen_string_literal: true

module Vapi
  module Types
    class FallbackMicrosoftVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::FallbackMicrosoftVoiceVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :style, -> { Vapi::Types::FallbackMicrosoftVoiceStyle }, optional: true, nullable: false
      field :style_degree, -> { Integer }, optional: true, nullable: false, api_name: "styleDegree"
      field :role, -> { Vapi::Types::FallbackMicrosoftVoiceRole }, optional: true, nullable: false
      field :speed, -> { Integer }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
