# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for transcribing speech with Cartesia, including model and language.
    class FallbackCartesiaTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackCartesiaTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackCartesiaTranscriberLanguage }, optional: true, nullable: false
      field :turn_start_threshold, -> { Integer }, optional: true, nullable: false, api_name: "turnStartThreshold"
      field :turn_eager_end_threshold, -> { Integer }, optional: true, nullable: false, api_name: "turnEagerEndThreshold"
      field :turn_end_threshold, -> { Integer }, optional: true, nullable: false, api_name: "turnEndThreshold"
      field :turn_end_timeout_ms, -> { Integer }, optional: true, nullable: false, api_name: "turnEndTimeoutMs"
    end
  end
end
