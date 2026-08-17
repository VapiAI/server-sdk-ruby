# frozen_string_literal: true

module Vapi
  module Simulations
    module Types
      class CreateSimulationDto < Internal::Types::Model
        field :client_source, -> { String }, optional: true, nullable: false, api_name: "x-client-source"
        field :simulation_entry_point, -> { String }, optional: true, nullable: false, api_name: "x-simulation-entry-point"
        field :name, -> { String }, optional: true, nullable: false
        field :scenario_id, -> { String }, optional: false, nullable: false, api_name: "scenarioId"
        field :personality_id, -> { String }, optional: false, nullable: false, api_name: "personalityId"
        field :path, -> { String }, optional: true, nullable: false
      end
    end
  end
end
