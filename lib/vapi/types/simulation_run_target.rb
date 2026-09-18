# frozen_string_literal: true

module Vapi
  module Types
    # The assistant or squad the run was tested against.
    class SimulationRunTarget < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::SimulationRunTargetAssistant }, key: "ASSISTANT"
      member -> { Vapi::Types::SimulationRunTargetSquad }, key: "SQUAD"
    end
  end
end
