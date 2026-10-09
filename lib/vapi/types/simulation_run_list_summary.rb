# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunListSummary < Internal::Types::Model
      field :source, -> { Vapi::Types::SimulationRunListSource }, optional: false, nullable: false
      field :target_snapshot_name, -> { String }, optional: true, nullable: false, api_name: "targetSnapshotName"
      field :simulation_count, -> { Integer }, optional: false, nullable: false, api_name: "simulationCount"
    end
  end
end
