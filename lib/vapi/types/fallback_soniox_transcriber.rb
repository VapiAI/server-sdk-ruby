# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for transcribing speech with Soniox, including model, language detection, endpointing, and
    # vocabulary.
    class FallbackSonioxTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackSonioxTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackSonioxTranscriberLanguage }, optional: true, nullable: false
      field :languages, -> { Internal::Types::Array[Vapi::Types::FallbackSonioxTranscriberLanguagesItem] }, optional: true, nullable: false
      field :language_hints_strict, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "languageHintsStrict"
      field :max_endpoint_delay_ms, -> { Integer }, optional: true, nullable: false, api_name: "maxEndpointDelayMs"
      field :endpoint_sensitivity, -> { Integer }, optional: true, nullable: false, api_name: "endpointSensitivity"
      field :endpoint_latency_adjustment_level, -> { Integer }, optional: true, nullable: false, api_name: "endpointLatencyAdjustmentLevel"
      field :custom_vocabulary, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "customVocabulary"
      field :context_general, -> { Internal::Types::Array[Vapi::Types::SonioxContextGeneralItem] }, optional: true, nullable: false, api_name: "contextGeneral"
    end
  end
end
