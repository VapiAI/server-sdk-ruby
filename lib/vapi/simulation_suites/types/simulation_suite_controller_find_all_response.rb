# frozen_string_literal: true

module Vapi
  module SimulationSuites
    module Types
      class SimulationSuiteControllerFindAllResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        member -> { Internal::Types::Array[Vapi::Types::SimulationSuite] }
        member -> { Vapi::Types::SimulationSuitesPaginatedResponse }
      end
    end
  end
end
