# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for transcribing speech during assistant conversations with Cartesia, including model, language, and
    # fallback settings.
    class CartesiaTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::CartesiaTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::CartesiaTranscriberLanguage }, optional: true, nullable: false
      field :turn_start_threshold, -> { Integer }, optional: true, nullable: false, api_name: "turnStartThreshold"
      field :turn_eager_end_threshold, -> { Integer }, optional: true, nullable: false, api_name: "turnEagerEndThreshold"
      field :turn_end_threshold, -> { Integer }, optional: true, nullable: false, api_name: "turnEndThreshold"
      field :turn_end_timeout_ms, -> { Integer }, optional: true, nullable: false, api_name: "turnEndTimeoutMs"
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
