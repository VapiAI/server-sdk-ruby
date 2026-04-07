# frozen_string_literal: true

module Vapi
  module Types
    class AssistantSpeechWordAlignmentTiming < Internal::Types::Model
      field :words, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :words_start_times_ms, -> { Internal::Types::Array[Integer] }, optional: false, nullable: false, api_name: "wordsStartTimesMs"
      field :words_end_times_ms, -> { Internal::Types::Array[Integer] }, optional: false, nullable: false, api_name: "wordsEndTimesMs"
    end
  end
end
