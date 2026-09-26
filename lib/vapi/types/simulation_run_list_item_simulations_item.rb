# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunListItemSimulationsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::SimulationRunSimulationEntry }, key: "SIMULATION"
      member -> { Vapi::Types::SimulationRunSuiteEntry }, key: "SIMULATION_SUITE"
    end
  end
end
