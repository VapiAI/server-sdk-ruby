# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptKeyValueResult < Internal::Types::Model
      field :index, -> { Integer }, optional: false, nullable: false
      field :value, -> { String }, optional: true, nullable: false
      field :verdict, -> { Vapi::Types::TranscriptKeyValueResultVerdict }, optional: false, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
