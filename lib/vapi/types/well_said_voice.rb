# frozen_string_literal: true

module Vapi
  module Types
    class WellSaidVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::WellSaidVoiceModel }, optional: true, nullable: false
      field :enable_ssml, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "enableSsml"
      field :library_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "libraryIds"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
