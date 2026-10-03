# frozen_string_literal: true

module Vapi
  module Types
    class FallbackXaiTranscriber < Internal::Types::Model
      field :model, -> { Vapi::Types::FallbackXaiTranscriberModel }, optional: true, nullable: false
      field :language, -> { Vapi::Types::FallbackXaiTranscriberLanguage }, optional: true, nullable: false
    end
  end
end
