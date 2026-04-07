# frozen_string_literal: true

module Vapi
  module Types
    class SimulationRunConfiguration < Internal::Types::Model
      field :transport, -> { Vapi::Types::SimulationRunTransportConfiguration }, optional: true, nullable: false
    end
  end
end
