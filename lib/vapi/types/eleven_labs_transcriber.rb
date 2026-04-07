# frozen_string_literal: true

module Vapi
  module Types
    class ElevenLabsTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::ElevenLabsTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::ElevenLabsTranscriberLanguage }, optional: true, nullable: false
      field :silence_threshold_seconds, -> { Integer }, optional: true, nullable: false, api_name: "silenceThresholdSeconds"
      field :confidence_threshold, -> { Integer }, optional: true, nullable: false, api_name: "confidenceThreshold"
      field :min_speech_duration_ms, -> { Integer }, optional: true, nullable: false, api_name: "minSpeechDurationMs"
      field :min_silence_duration_ms, -> { Integer }, optional: true, nullable: false, api_name: "minSilenceDurationMs"
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
