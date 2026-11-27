# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptEvaluationResult < Internal::Types::Model
      field :wer, -> { Integer }, optional: false, nullable: true
      field :hits, -> { Integer }, optional: false, nullable: false
      field :substitutions, -> { Integer }, optional: false, nullable: false
      field :deletions, -> { Integer }, optional: false, nullable: false
      field :insertions, -> { Integer }, optional: false, nullable: false
      field :reference_word_count, -> { Integer }, optional: false, nullable: false, api_name: "referenceWordCount"
      field :hypothesis_word_count, -> { Integer }, optional: false, nullable: false, api_name: "hypothesisWordCount"
      field :key_values, -> { Internal::Types::Array[Vapi::Types::TranscriptKeyValueResult] }, optional: false, nullable: false, api_name: "keyValues"
      field :evaluations, -> { Internal::Types::Array[Vapi::Types::TranscriptMetricEvaluationResult] }, optional: false, nullable: false
      field :passed, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
