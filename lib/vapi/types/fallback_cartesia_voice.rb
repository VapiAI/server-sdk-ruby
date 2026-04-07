# frozen_string_literal: true

module Vapi
  module Types
    class FallbackCartesiaVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { String }, optional: false, nullable: false, api_name: "voiceId"
      field :model, -> { Vapi::Types::FallbackCartesiaVoiceModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackCartesiaVoiceLanguage }, optional: true, nullable: false
      field :experimental_controls, -> { Vapi::Types::CartesiaExperimentalControls }, optional: true, nullable: false, api_name: "experimentalControls"
      field :generation_config, -> { Vapi::Types::CartesiaGenerationConfig }, optional: true, nullable: false, api_name: "generationConfig"
      field :pronunciation_dict_id, -> { String }, optional: true, nullable: false, api_name: "pronunciationDictId"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
    end
  end
end
