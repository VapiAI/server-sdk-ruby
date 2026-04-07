# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunSimulationEntry < Internal::Types::Model
      field :simulation_id, -> { String }, optional: true, nullable: false, api_name: "simulationId"
      field :scenario_id, -> { String }, optional: true, nullable: false, api_name: "scenarioId"
      field :scenario, -> { Vapi::Types::CreateScenarioDto }, optional: true, nullable: false
      field :personality_id, -> { String }, optional: true, nullable: false, api_name: "personalityId"
      field :personality, -> { Vapi::Types::CreatePersonalityDto }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
