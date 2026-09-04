# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunItemCounts < Internal::Types::Model
      field :total, -> { Integer }, optional: false, nullable: false
      field :passed, -> { Integer }, optional: false, nullable: false
      field :failed, -> { Integer }, optional: false, nullable: false
      field :running, -> { Integer }, optional: false, nullable: false
      field :queued, -> { Integer }, optional: false, nullable: false
      field :canceled, -> { Integer }, optional: false, nullable: false
      field :distinct_simulation_total, -> { Integer }, optional: true, nullable: false, api_name: "distinctSimulationTotal"
      field :distinct_simulation_failed, -> { Integer }, optional: true, nullable: false, api_name: "distinctSimulationFailed"
    end
  end
end
