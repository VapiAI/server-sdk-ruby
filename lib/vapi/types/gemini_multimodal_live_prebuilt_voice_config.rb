# frozen_string_literal: true

module Vapi
  module Types
    # Selects a prebuilt voice for Gemini Multimodal Live audio output.
    class GeminiMultimodalLivePrebuiltVoiceConfig < Internal::Types::Model
      field :voice_name, -> { Vapi::Types::GeminiMultimodalLivePrebuiltVoiceConfigVoiceName }, optional: false, nullable: false, api_name: "voiceName"
    end
  end
end
