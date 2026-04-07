# frozen_string_literal: true

module Vapi
  module Types
    class FallbackNeuphonicVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::FallbackNeuphonicVoiceModel }, optional: true, nullable: false
      field :language, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :speed, -> { Integer }, optional: true, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
