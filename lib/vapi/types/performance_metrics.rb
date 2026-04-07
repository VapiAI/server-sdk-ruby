# frozen_string_literal: true

module Vapi
  module Types
    class PerformanceMetrics < Internal::Types::Model
      field :turn_latencies, -> { Internal::Types::Array[Vapi::Types::TurnLatency] }, optional: true, nullable: false, api_name: "turnLatencies"
      field :model_latency_average, -> { Integer }, optional: true, nullable: false, api_name: "modelLatencyAverage"
      field :voice_latency_average, -> { Integer }, optional: true, nullable: false, api_name: "voiceLatencyAverage"
      field :transcriber_latency_average, -> { Integer }, optional: true, nullable: false, api_name: "transcriberLatencyAverage"
      field :endpointing_latency_average, -> { Integer }, optional: true, nullable: false, api_name: "endpointingLatencyAverage"
      field :turn_latency_average, -> { Integer }, optional: true, nullable: false, api_name: "turnLatencyAverage"
      field :from_transport_latency_average, -> { Integer }, optional: true, nullable: false, api_name: "fromTransportLatencyAverage"
      field :to_transport_latency_average, -> { Integer }, optional: true, nullable: false, api_name: "toTransportLatencyAverage"
      field :num_user_interrupted, -> { Integer }, optional: true, nullable: false, api_name: "numUserInterrupted"
      field :num_assistant_interrupted, -> { Integer }, optional: true, nullable: false, api_name: "numAssistantInterrupted"
    end
  end
end
