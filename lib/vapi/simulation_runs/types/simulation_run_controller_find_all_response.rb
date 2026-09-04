# frozen_string_literal: true

module Vapi
  module SimulationRuns
    module Types
      class SimulationRunControllerFindAllResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Internal::Types::Array[Vapi::Types::SimulationRun] }
        member -> { Vapi::Types::SimulationRunsPaginatedResponse }
      end
    end
  end
end
