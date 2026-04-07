# frozen_string_literal: true

module Vapi
  module Types
    class CreateScenarioDtoHooksItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :on

      member -> { Vapi::Types::SimulationHookCallStarted }, key: "SIMULATION_RUN_STARTED"
      member -> { Vapi::Types::SimulationHookCallEnded }, key: "SIMULATION_RUN_ENDED"
    end
  end
end
