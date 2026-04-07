# frozen_string_literal: true

module Vapi
  module Types
    class FallbackLmntVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::FallbackLmntVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :speed, -> { Integer }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackLmntVoiceLanguage }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
