# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptMetricEvaluationResult < Internal::Types::Model
      field :index, -> { Integer }, optional: false, nullable: false
      field :metric, -> { Vapi::Types::TranscriptMetricEvaluationResultMetric }, optional: false, nullable: false
      field :comparator, -> { Vapi::Types::TranscriptMetricEvaluationResultComparator }, optional: false, nullable: false
      field :expected_value, -> { Integer }, optional: false, nullable: false, api_name: "expectedValue"
      field :actual_value, -> { Integer }, optional: false, nullable: true, api_name: "actualValue"
      field :passed, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
