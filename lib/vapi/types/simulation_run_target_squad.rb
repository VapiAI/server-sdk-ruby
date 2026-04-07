# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunTargetSquad < Internal::Types::Model
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
      field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
    end
  end
end
