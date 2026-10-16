# frozen_string_literal: true

module Vapi
  module Types
    # Speech-output configuration for Gemini Multimodal Live.
    class GeminiMultimodalLiveSpeechConfig < Internal::Types::Model
      field :voice_config, -> { Vapi::Types::GeminiMultimodalLiveVoiceConfig }, optional: false, nullable: false, api_name: "voiceConfig"
    end
  end
end
