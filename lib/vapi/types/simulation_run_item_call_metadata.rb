# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemCallMetadata < Internal::Types::Model
      field :transcript, -> { String }, optional: true, nullable: false
      field :messages, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      field :recording_url, -> { String }, optional: true, nullable: false, api_name: "recordingUrl"
      field :monitor, -> { Vapi::Types::SimulationRunItemCallMonitor }, optional: true, nullable: false
    end
  end
end
