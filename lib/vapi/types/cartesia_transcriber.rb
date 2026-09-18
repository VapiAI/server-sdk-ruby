# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for transcribing speech during assistant conversations with Cartesia, including model, language, and
    # fallback settings.
    class CartesiaTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::CartesiaTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::CartesiaTranscriberLanguage }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
