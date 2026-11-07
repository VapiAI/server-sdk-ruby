# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabVersionMetricsDto < Internal::Types::Model
      field :assistant_version_id, -> { String }, optional: true, nullable: false, api_name: "assistantVersionId"
      field :assistant_version_label, -> { String }, optional: true, nullable: false, api_name: "assistantVersionLabel"
      field :unversioned, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :calls, -> { Integer }, optional: false, nullable: false
      field :configured_percentage, -> { Integer }, optional: true, nullable: false, api_name: "configuredPercentage"
      field :actual_percentage, -> { Integer }, optional: false, nullable: false, api_name: "actualPercentage"
      field :duration_seconds, -> { Vapi::Types::TrafficTabDurationSecondsDto }, optional: false, nullable: false, api_name: "durationSeconds"
      field :cost_per_minute, -> { Vapi::Types::TrafficTabCostPerMinuteDto }, optional: false, nullable: false, api_name: "costPerMinute"
      field :latency_ms, -> { Vapi::Types::TrafficTabLatencyMsDto }, optional: false, nullable: false, api_name: "latencyMs"
      field :ended_reasons, -> { Internal::Types::Array[Vapi::Types::TrafficTabEndedReasonCountDto] }, optional: false, nullable: false, api_name: "endedReasons"
      field :timeseries, -> { Internal::Types::Array[Vapi::Types::TrafficTabTimeseriesPointDto] }, optional: false, nullable: false
      field :structured_outputs, -> { Internal::Types::Array[Vapi::Types::TrafficTabStructuredOutputDto] }, optional: true, nullable: false, api_name: "structuredOutputs"
    end
  end
end
