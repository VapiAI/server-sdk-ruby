# frozen_string_literal: true

module Vapi
  module Types
    class SimulationHookInclude < Internal::Types::Model
      field :transcript, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :messages, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :recording_url, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "recordingUrl"
    end
  end
end
