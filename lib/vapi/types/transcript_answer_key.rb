# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptAnswerKey < Internal::Types::Model
      field :transcript, -> { String }, optional: false, nullable: false
      field :key_values, -> { Internal::Types::Array[Vapi::Types::TranscriptKeyValue] }, optional: true, nullable: false, api_name: "keyValues"
    end
  end
end
