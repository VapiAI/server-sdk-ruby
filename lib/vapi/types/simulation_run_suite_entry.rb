# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunSuiteEntry < Internal::Types::Model
      field :simulation_suite_id, -> { String }, optional: true, nullable: false, api_name: "simulationSuiteId"
      field :suite_id, -> { String }, optional: true, nullable: false, api_name: "suiteId"
    end
  end
end
