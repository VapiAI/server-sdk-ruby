# frozen_string_literal: true

module Vapi
  module Types
    class LatencyExpectation < Internal::Types::Model
      field :metric, -> { Vapi::Types::LatencyExpectationMetric }, optional: false, nullable: false
      field :aggregation, -> { Vapi::Types::LatencyExpectationAggregation }, optional: false, nullable: false
      field :threshold_ms, -> { Integer }, optional: false, nullable: false, api_name: "thresholdMs"
      field :required, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
