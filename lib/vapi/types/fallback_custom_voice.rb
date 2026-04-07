# frozen_string_literal: true

module Vapi
  module Types
    class FallbackCustomVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { String }, optional: true, nullable: false, api_name: "voiceId"
      field :server, -> { Vapi::Types::Server }, optional: false, nullable: false
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
