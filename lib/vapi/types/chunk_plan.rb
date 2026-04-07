# frozen_string_literal: true

module Vapi
  module Types
    class ChunkPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :min_characters, -> { Integer }, optional: true, nullable: false, api_name: "minCharacters"
      field :punctuation_boundaries, -> { Internal::Types::Array[Vapi::Types::PunctuationBoundary] }, optional: true, nullable: false, api_name: "punctuationBoundaries"
      field :format_plan, -> { Vapi::Types::FormatPlan }, optional: true, nullable: false, api_name: "formatPlan"
    end
  end
end
