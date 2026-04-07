# frozen_string_literal: true

module Vapi
  module Types
    class FallbackPlayHtVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::FallbackPlayHtVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :speed, -> { Integer }, optional: true, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :emotion, -> { Vapi::Types::FallbackPlayHtVoiceEmotion }, optional: true, nullable: false
      field :voice_guidance, -> { Integer }, optional: true, nullable: false, api_name: "voiceGuidance"
      field :style_guidance, -> { Integer }, optional: true, nullable: false, api_name: "styleGuidance"
      field :text_guidance, -> { Integer }, optional: true, nullable: false, api_name: "textGuidance"
      field :model, -> { Vapi::Types::FallbackPlayHtVoiceModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackPlayHtVoiceLanguage }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
