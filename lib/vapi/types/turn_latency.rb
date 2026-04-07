# frozen_string_literal: true

module Vapi
  module Types
    class TurnLatency < Internal::Types::Model
      field :model_latency, -> { Integer }, optional: true, nullable: false, api_name: "modelLatency"
      field :voice_latency, -> { Integer }, optional: true, nullable: false, api_name: "voiceLatency"
      field :transcriber_latency, -> { Integer }, optional: true, nullable: false, api_name: "transcriberLatency"
      field :endpointing_latency, -> { Integer }, optional: true, nullable: false, api_name: "endpointingLatency"
      field :turn_latency, -> { Integer }, optional: true, nullable: false, api_name: "turnLatency"
    end
  end
end
