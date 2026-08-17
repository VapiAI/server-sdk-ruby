# frozen_string_literal: true

module Vapi
  module Simulations
    module Types
      class GenerateScenariosDto < Internal::Types::Model
        field :client_source, -> { String }, optional: true, nullable: false, api_name: "x-client-source"
        field :simulation_entry_point, -> { String }, optional: true, nullable: false, api_name: "x-simulation-entry-point"
        field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
        field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      end
    end
  end
end
