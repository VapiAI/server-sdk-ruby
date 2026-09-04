# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for transcribing speech with Cartesia, including model and language.
    class FallbackCartesiaTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackCartesiaTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackCartesiaTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
