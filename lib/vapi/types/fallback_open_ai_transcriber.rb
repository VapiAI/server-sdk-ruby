# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for transcribing speech with OpenAI, including model and language.
    class FallbackOpenAiTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackOpenAiTranscriberModel }, optional: false, nullable: false
      field :language, -> { Vapi::Types::FallbackOpenAiTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
