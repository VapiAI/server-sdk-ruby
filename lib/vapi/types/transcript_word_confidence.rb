# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptWordConfidence < Internal::Types::Model
      field :word, -> { String }, optional: false, nullable: false
      field :start, -> { Integer }, optional: false, nullable: false
      field :end_, -> { Integer }, optional: false, nullable: false, api_name: "end"
      field :confidence, -> { Integer }, optional: false, nullable: false
      field :punctuated_word, -> { String }, optional: true, nullable: false
      field :language, -> { String }, optional: true, nullable: false
      field :speaker, -> { Integer }, optional: true, nullable: false
    end
  end
end
