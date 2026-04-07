# frozen_string_literal: true

module Vapi
  module Types
    class FallbackDeepgramVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::FallbackDeepgramVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::FallbackDeepgramVoiceModel }, optional: true, nullable: false
      field :mip_opt_out, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "mipOptOut"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
