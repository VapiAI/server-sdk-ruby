# frozen_string_literal: true

module Vapi
  module Types
    class MinimaxVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::MinimaxVoiceModel }, optional: true, nullable: false
      field :emotion, -> { String }, optional: true, nullable: false
      field :subtitle_type, -> { Vapi::Types::MinimaxVoiceSubtitleType }, optional: true, nullable: false, api_name: "subtitleType"
      field :pitch, -> { Integer }, optional: true, nullable: false
      field :speed, -> { Integer }, optional: true, nullable: false
      field :volume, -> { Integer }, optional: true, nullable: false
      field :region, -> { Vapi::Types::MinimaxVoiceRegion }, optional: true, nullable: false
      field :language_boost, -> { Vapi::Types::MinimaxVoiceLanguageBoost }, optional: true, nullable: false, api_name: "languageBoost"
      field :text_normalization_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "textNormalizationEnabled"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
