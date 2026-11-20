# frozen_string_literal: true

module Vapi
  module Types
    # Fallback configuration for transcribing speech with Talkscriber, including model and language.
    class FallbackTalkscriberTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackTalkscriberTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackTalkscriberTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
