# frozen_string_literal: true

module Vapi
  module Types
    class FallbackWellSaidVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::FallbackWellSaidVoiceModel }, optional: true, nullable: false
      field :enable_ssml, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "enableSsml"
      field :library_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "libraryIds"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
