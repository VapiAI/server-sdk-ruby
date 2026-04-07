# frozen_string_literal: true

module Vapi
  module Types
    class HumeVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :model, -> { Vapi::Types::HumeVoiceModel }, optional: true, nullable: false
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :is_custom_hume_voice, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isCustomHumeVoice"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :description, -> { String }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
