# frozen_string_literal: true

module Vapi
  module Types
    class LatencyEvaluationResult < Internal::Types::Model
      field :metric, -> { Vapi::Types::LatencyEvaluationResultMetric }, optional: false, nullable: false
      field :aggregation, -> { Vapi::Types::LatencyEvaluationResultAggregation }, optional: false, nullable: false
      field :threshold_ms, -> { Integer }, optional: false, nullable: false, api_name: "thresholdMs"
      field :actual_ms, -> { Integer }, optional: true, nullable: false, api_name: "actualMs"
      field :sample_count, -> { Integer }, optional: false, nullable: false, api_name: "sampleCount"
      field :passed, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :is_skipped, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isSkipped"
      field :skip_reason, -> { String }, optional: true, nullable: false, api_name: "skipReason"
    end
  end
end
