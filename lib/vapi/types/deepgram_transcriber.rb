# frozen_string_literal: true

module Vapi
  module Types
    class DeepgramTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::DeepgramTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::DeepgramTranscriberLanguage }, optional: true, nullable: false
      field :smart_format, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "smartFormat"
      field :mip_opt_out, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "mipOptOut"
      field :numerals, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :profanity_filter, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "profanityFilter"
      field :confidence_threshold, -> { Integer }, optional: true, nullable: false, api_name: "confidenceThreshold"
      field :eager_eot_threshold, -> { Integer }, optional: true, nullable: false, api_name: "eagerEotThreshold"
      field :eot_threshold, -> { Integer }, optional: true, nullable: false, api_name: "eotThreshold"
      field :eot_timeout_ms, -> { Integer }, optional: true, nullable: false, api_name: "eotTimeoutMs"
      field :keywords, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :keyterm, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :endpointing, -> { Integer }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
