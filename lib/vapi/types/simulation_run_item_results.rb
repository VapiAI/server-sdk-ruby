# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemResults < Internal::Types::Model
      field :evaluations, -> { Internal::Types::Array[Vapi::Types::StructuredOutputEvaluationResult] }, optional: false, nullable: false
      field :passed, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :latency_metrics, -> { Vapi::Types::LatencyMetrics }, optional: true, nullable: false, api_name: "latencyMetrics"
      field :latency_evaluations, -> { Internal::Types::Array[Vapi::Types::LatencyEvaluationResult] }, optional: true, nullable: false, api_name: "latencyEvaluations"
    end
  end
end
