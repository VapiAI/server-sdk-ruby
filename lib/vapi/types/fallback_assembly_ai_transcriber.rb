# frozen_string_literal: true

module Vapi
  module Types
    class FallbackAssemblyAiTranscriber < Internal::Types::Model
      field :language, -> { Vapi::Types::FallbackAssemblyAiTranscriberLanguage }, optional: true, nullable: false
      field :confidence_threshold, -> { Integer }, optional: true, nullable: false, api_name: "confidenceThreshold"
      field :format_turns, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "formatTurns"
      field :end_of_turn_confidence_threshold, -> { Integer }, optional: true, nullable: false, api_name: "endOfTurnConfidenceThreshold"
      field :min_end_of_turn_silence_when_confident, -> { Integer }, optional: true, nullable: false, api_name: "minEndOfTurnSilenceWhenConfident"
      field :word_finalization_max_wait_time, -> { Integer }, optional: true, nullable: false, api_name: "wordFinalizationMaxWaitTime"
      field :max_turn_silence, -> { Integer }, optional: true, nullable: false, api_name: "maxTurnSilence"
      field :vad_assisted_endpointing_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "vadAssistedEndpointingEnabled"
      field :speech_model, -> { Vapi::Types::FallbackAssemblyAiTranscriberSpeechModel }, optional: true, nullable: false, api_name: "speechModel"
      field :realtime_url, -> { String }, optional: true, nullable: false, api_name: "realtimeUrl"
      field :word_boost, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "wordBoost"
      field :keyterms_prompt, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "keytermsPrompt"
      field :end_utterance_silence_threshold, -> { Integer }, optional: true, nullable: false, api_name: "endUtteranceSilenceThreshold"
      field :disable_partial_transcripts, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "disablePartialTranscripts"
    end
  end
end
