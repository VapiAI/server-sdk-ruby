# frozen_string_literal: true

module Vapi
  module Types
    class GeminiMultimodalLiveSpeechConfig < Internal::Types::Model
      field :voice_config, -> { Vapi::Types::GeminiMultimodalLiveVoiceConfig }, optional: false, nullable: false, api_name: "voiceConfig"
    end
  end
end
