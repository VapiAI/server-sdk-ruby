# frozen_string_literal: true

module Vapi
  module SimulationScenarios
    module Types
      class ScenarioControllerCreateRequest < Internal::Types::Model
        field :client_source, -> { String }, optional: true, nullable: false, api_name: "x-client-source"
        field :simulation_entry_point, -> { String }, optional: true, nullable: false, api_name: "x-simulation-entry-point"
        field :body, -> { Vapi::Types::CreateScenarioDto }, optional: false, nullable: false
      end
    end
  end
end
