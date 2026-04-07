# frozen_string_literal: true

module Vapi
  module Types
    class CartesiaVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::CartesiaVoiceModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::CartesiaVoiceLanguage }, optional: true, nullable: false
      field :experimental_controls, -> { Vapi::Types::CartesiaExperimentalControls }, optional: true, nullable: false, api_name: "experimentalControls"
      field :generation_config, -> { Vapi::Types::CartesiaGenerationConfig }, optional: true, nullable: false, api_name: "generationConfig"
      field :pronunciation_dict_id, -> { String }, optional: true, nullable: false, api_name: "pronunciationDictId"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
