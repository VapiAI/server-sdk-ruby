# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunConfiguration < Internal::Types::Model
      field :include_target_structured_outputs, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeTargetStructuredOutputs"
      field :transport, -> { Vapi::Types::SimulationRunTransportConfiguration }, optional: true, nullable: false
    end
  end
end
