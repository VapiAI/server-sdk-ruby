# frozen_string_literal: true

module Vapi
  module SimulationRuns
    module Types
      class SimulationRunControllerFindItemsResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Internal::Types::Array[Vapi::Types::SimulationRunItem] }
        member -> { Vapi::Types::SimulationRunItemsPaginatedResponse }
      end
    end
  end
end
