# frozen_string_literal: true

module Vapi
  module Types
    # Target to test against
    class CreateSimulationRunDtoTarget < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::SimulationRunTargetAssistant }, key: "ASSISTANT"
      member -> { Vapi::Types::SimulationRunTargetSquad }, key: "SQUAD"
    end
  end
end
