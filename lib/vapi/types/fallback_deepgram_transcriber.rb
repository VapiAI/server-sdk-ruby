# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for transcribing speech with Deepgram, including model, language, formatting, endpointing,
    # and vocabulary.
    class FallbackDeepgramTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::DeepgramTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::DeepgramTranscriberLanguage }, optional: true, nullable: false
      field :smart_format, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "smartFormat"
      field :mip_opt_out, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "mipOptOut"
      field :numerals, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :profanity_filter, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "profanityFilter"
      field :redaction, -> { Internal::Types::Array[Vapi::Types::FallbackDeepgramTranscriberRedactionItem] }, optional: true, nullable: false
      field :confidence_threshold, -> { Integer }, optional: true, nullable: false, api_name: "confidenceThreshold"
      field :eot_threshold, -> { Integer }, optional: true, nullable: false, api_name: "eotThreshold"
      field :eot_timeout_ms, -> { Integer }, optional: true, nullable: false, api_name: "eotTimeoutMs"
      field :languages, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :keywords, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :keyterm, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :endpointing, -> { Integer }, optional: true, nullable: false
    end
  end
end
