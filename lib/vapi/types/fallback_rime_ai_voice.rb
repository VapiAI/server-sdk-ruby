# frozen_string_literal: true

module Vapi
  module Types
    class FallbackRimeAiVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::FallbackRimeAiVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::FallbackRimeAiVoiceModel }, optional: true, nullable: false
      field :speed, -> { Integer }, optional: true, nullable: false
      field :pause_between_brackets, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "pauseBetweenBrackets"
      field :phonemize_between_brackets, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "phonemizeBetweenBrackets"
      field :reduce_latency, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "reduceLatency"
      field :inline_speed_alpha, -> { String }, optional: true, nullable: false, api_name: "inlineSpeedAlpha"
      field :language, -> { Vapi::Types::FallbackRimeAiVoiceLanguage }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
