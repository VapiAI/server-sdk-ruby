# frozen_string_literal: true

module Vapi
  module Types
    class GladiaVocabularyItemDto < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false
      field :pronunciations, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :intensity, -> { Integer }, optional: true, nullable: false
      field :language, -> { String }, optional: true, nullable: false
    end
  end
end
