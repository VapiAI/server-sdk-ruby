# frozen_string_literal: true

module Vapi
  module Types
    # Custom vocabulary configuration for Gladia transcription, including vocabulary items and default recognition
    # intensity.
    class GladiaCustomVocabularyConfigDto < Internal::Types::Model
      field :vocabulary, -> { Internal::Types::Array[Vapi::Types::GladiaCustomVocabularyConfigDtoVocabularyItem] }, optional: false, nullable: false
      field :default_intensity, -> { Integer }, optional: true, nullable: false, api_name: "defaultIntensity"
    end
  end
end
