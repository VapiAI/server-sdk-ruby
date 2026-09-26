# frozen_string_literal: true

module Vapi
  module Types
    # Voice selection configuration for Gemini Multimodal Live.
    class GeminiMultimodalLiveVoiceConfig < Internal::Types::Model
      field :prebuilt_voice_config, -> { Vapi::Types::GeminiMultimodalLivePrebuiltVoiceConfig }, optional: false, nullable: false, api_name: "prebuiltVoiceConfig"
    end
  end
end
