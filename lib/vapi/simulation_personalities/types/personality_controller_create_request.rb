# frozen_string_literal: true

module Vapi
  module SimulationPersonalities
    module Types
      class PersonalityControllerCreateRequest < Internal::Types::Model
        field :client_source, -> { String }, optional: true, nullable: false, api_name: "x-client-source"
        field :simulation_entry_point, -> { String }, optional: true, nullable: false, api_name: "x-simulation-entry-point"
        field :body, -> { Vapi::Types::CreatePersonalityDto }, optional: false, nullable: false
      end
    end
  end
end
