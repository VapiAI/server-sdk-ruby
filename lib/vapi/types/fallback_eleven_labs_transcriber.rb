# frozen_string_literal: true

module Vapi
  module Types
    class FallbackElevenLabsTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackElevenLabsTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackElevenLabsTranscriberLanguage }, optional: true, nullable: false
      field :silence_threshold_seconds, -> { Integer }, optional: true, nullable: false, api_name: "silenceThresholdSeconds"
      field :confidence_threshold, -> { Integer }, optional: true, nullable: false, api_name: "confidenceThreshold"
      field :min_speech_duration_ms, -> { Integer }, optional: true, nullable: false, api_name: "minSpeechDurationMs"
      field :min_silence_duration_ms, -> { Integer }, optional: true, nullable: false, api_name: "minSilenceDurationMs"
    end
  end
end
