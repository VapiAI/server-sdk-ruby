# frozen_string_literal: true

module Vapi
  module Types
    class UserMessageMetadata < Internal::Types::Model
      field :word_level_confidence, -> { Internal::Types::Array[Vapi::Types::TranscriptWordConfidence] }, optional: true, nullable: false, api_name: "wordLevelConfidence"
      field :type, -> { String }, optional: true, nullable: false
      field :source, -> { String }, optional: true, nullable: false
    end
  end
end
