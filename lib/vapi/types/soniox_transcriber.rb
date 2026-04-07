# frozen_string_literal: true

module Vapi
  module Types
    class SonioxTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::SonioxTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::SonioxTranscriberLanguage }, optional: true, nullable: false
      field :language_hints_strict, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "languageHintsStrict"
      field :max_endpoint_delay_ms, -> { Integer }, optional: true, nullable: false, api_name: "maxEndpointDelayMs"
      field :custom_vocabulary, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "customVocabulary"
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
