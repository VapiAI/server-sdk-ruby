# frozen_string_literal: true

module Vapi
  module Types
    class SimulationOnboardingSuiteEditDto < Internal::Types::Model
      field :simulation_id, -> { String }, optional: false, nullable: false, api_name: "simulationId"
      field :instruction, -> { String }, optional: false, nullable: false
    end
  end
end
