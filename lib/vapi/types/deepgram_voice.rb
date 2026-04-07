# frozen_string_literal: true

module Vapi
  module Types
    class DeepgramVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::DeepgramVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::DeepgramVoiceModel }, optional: true, nullable: false
      field :mip_opt_out, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "mipOptOut"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
