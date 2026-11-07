# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for transcribing speech with Google, including model and language.
    class FallbackGoogleTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackGoogleTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackGoogleTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
