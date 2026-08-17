# frozen_string_literal: true

module Vapi
  module SimulationPersonalities
    module Types
      class PersonalityControllerRemoveRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :client_source, -> { String }, optional: true, nullable: false, api_name: "x-client-source"
        field :simulation_entry_point, -> { String }, optional: true, nullable: false, api_name: "x-simulation-entry-point"
      end
    end
  end
end
