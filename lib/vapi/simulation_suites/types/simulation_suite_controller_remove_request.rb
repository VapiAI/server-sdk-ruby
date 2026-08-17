# frozen_string_literal: true

module Vapi
  module SimulationSuites
    module Types
      class SimulationSuiteControllerRemoveRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :client_source, -> { String }, optional: true, nullable: false, api_name: "x-client-source"
        field :simulation_entry_point, -> { String }, optional: true, nullable: false, api_name: "x-simulation-entry-point"
      end
    end
  end
end
