# frozen_string_literal: true

module Vapi
  module Types
    class FallbackMinimaxVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :provider, -> { Vapi::Types::FallbackMinimaxVoiceProvider }, optional: false, nullable: false
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::FallbackMinimaxVoiceModel }, optional: true, nullable: false
      field :emotion, -> { String }, optional: true, nullable: false
      field :subtitle_type, -> { Vapi::Types::FallbackMinimaxVoiceSubtitleType }, optional: true, nullable: false, api_name: "subtitleType"
      field :pitch, -> { Integer }, optional: true, nullable: false
      field :speed, -> { Integer }, optional: true, nullable: false
      field :volume, -> { Integer }, optional: true, nullable: false
      field :region, -> { Vapi::Types::FallbackMinimaxVoiceRegion }, optional: true, nullable: false
      field :language_boost, -> { Vapi::Types::FallbackMinimaxVoiceLanguageBoost }, optional: true, nullable: false, api_name: "languageBoost"
      field :text_normalization_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "textNormalizationEnabled"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
