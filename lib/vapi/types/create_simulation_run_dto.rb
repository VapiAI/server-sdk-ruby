# frozen_string_literal: true

module Vapi
  module Types
    class CreateSimulationRunDto < Internal::Types::Model
      field :simulations, -> { Internal::Types::Array[Vapi::Types::CreateSimulationRunDtoSimulationsItem] }, optional: false, nullable: false
      field :target, -> { Vapi::Types::CreateSimulationRunDtoTarget }, optional: false, nullable: false
      field :iterations, -> { Integer }, optional: true, nullable: false
      field :transport, -> { Vapi::Types::SimulationRunTransportConfiguration }, optional: true, nullable: false
    end
  end
end
