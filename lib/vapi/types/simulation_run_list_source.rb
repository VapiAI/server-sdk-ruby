# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunListSource < Internal::Types::Model
      field :type, -> { Vapi::Types::SimulationRunListSourceType }, optional: false, nullable: false
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :linkable, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :simulation_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "simulationIds"
    end
  end
end
