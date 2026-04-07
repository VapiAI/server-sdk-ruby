# frozen_string_literal: true

module Vapi
  module Types
    class GladiaCustomVocabularyConfigDto < Internal::Types::Model
      field :vocabulary, -> { Internal::Types::Array[Vapi::Types::GladiaCustomVocabularyConfigDtoVocabularyItem] }, optional: false, nullable: false
      field :default_intensity, -> { Integer }, optional: true, nullable: false, api_name: "defaultIntensity"
    end
  end
end
