# frozen_string_literal: true

module Vapi
  module Types
    class FallbackGoogleTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackGoogleTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackGoogleTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
