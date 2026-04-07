# frozen_string_literal: true

module Vapi
  module Types
    class FallbackGladiaTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackGladiaTranscriberModel }, optional: true, nullable: false
      field :language_behaviour, -> { Vapi::Types::FallbackGladiaTranscriberLanguageBehaviour }, optional: true, nullable: false, api_name: "languageBehaviour"
      field :language, -> { Vapi::Types::FallbackGladiaTranscriberLanguage }, optional: true, nullable: false
      field :languages, -> { Vapi::Types::FallbackGladiaTranscriberLanguages }, optional: true, nullable: false
      field :transcription_hint, -> { String }, optional: true, nullable: false, api_name: "transcriptionHint"
      field :prosody, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :audio_enhancer, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "audioEnhancer"
      field :confidence_threshold, -> { Integer }, optional: true, nullable: false, api_name: "confidenceThreshold"
      field :endpointing, -> { Integer }, optional: true, nullable: false
      field :speech_threshold, -> { Integer }, optional: true, nullable: false, api_name: "speechThreshold"
      field :custom_vocabulary_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "customVocabularyEnabled"
      field :custom_vocabulary_config, -> { Vapi::Types::GladiaCustomVocabularyConfigDto }, optional: true, nullable: false, api_name: "customVocabularyConfig"
      field :region, -> { Vapi::Types::FallbackGladiaTranscriberRegion }, optional: true, nullable: false
      field :receive_partial_transcripts, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "receivePartialTranscripts"
    end
  end
end
