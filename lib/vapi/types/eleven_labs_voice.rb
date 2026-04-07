# frozen_string_literal: true

module Vapi
  module Types
    class ElevenLabsVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::ElevenLabsVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :stability, -> { Integer }, optional: true, nullable: false
      field :similarity_boost, -> { Integer }, optional: true, nullable: false, api_name: "similarityBoost"
      field :style, -> { Integer }, optional: true, nullable: false
      field :use_speaker_boost, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "useSpeakerBoost"
      field :speed, -> { Integer }, optional: true, nullable: false
      field :optimize_streaming_latency, -> { Integer }, optional: true, nullable: false, api_name: "optimizeStreamingLatency"
      field :enable_ssml_parsing, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "enableSsmlParsing"
      field :auto_mode, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoMode"
      field :model, -> { Vapi::Types::ElevenLabsVoiceModel }, optional: true, nullable: false
      field :language, -> { String }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :pronunciation_dictionary_locators, -> { Internal::Types::Array[Vapi::Types::ElevenLabsPronunciationDictionaryLocator] }, optional: true, nullable: false, api_name: "pronunciationDictionaryLocators"
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
