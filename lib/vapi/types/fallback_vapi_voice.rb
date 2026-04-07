# frozen_string_literal: true

module Vapi
  module Types
    class FallbackVapiVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::FallbackVapiVoiceVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :speed, -> { Integer }, optional: true, nullable: false
      field :pronunciation_dictionary, -> { Internal::Types::Array[Vapi::Types::VapiPronunciationDictionaryLocator] }, optional: true, nullable: false, api_name: "pronunciationDictionary"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
