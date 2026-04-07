# frozen_string_literal: true

module Vapi
  module Types
    class AssistantSpeechWordProgressTiming < Internal::Types::Model
      field :words_spoken, -> { Integer }, optional: false, nullable: false, api_name: "wordsSpoken"
      field :total_words, -> { Integer }, optional: false, nullable: false, api_name: "totalWords"
      field :segment, -> { String }, optional: true, nullable: false
      field :segment_duration_ms, -> { Integer }, optional: true, nullable: false, api_name: "segmentDurationMs"
      field :words, -> { Internal::Types::Array[Vapi::Types::AssistantSpeechWordTimestamp] }, optional: true, nullable: false
    end
  end
end
