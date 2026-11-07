# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabTimeseriesPointDto < Internal::Types::Model
      field :bucket_start, -> { String }, optional: false, nullable: false, api_name: "bucketStart"
      field :calls, -> { Integer }, optional: false, nullable: false
      field :duration_seconds_mean, -> { Integer }, optional: true, nullable: false, api_name: "durationSecondsMean"
      field :cost_per_minute_mean, -> { Integer }, optional: true, nullable: false, api_name: "costPerMinuteMean"
      field :turn_latency_ms_mean, -> { Integer }, optional: true, nullable: false, api_name: "turnLatencyMsMean"
    end
  end
end
