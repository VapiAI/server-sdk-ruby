# frozen_string_literal: true

module Vapi
  module SimulationRuns
    module Types
      module SimulationRunControllerFindAllRequestFilterStatus
        extend Vapi::Internal::Types::Enum

        PASSED = "passed"
        FAILED = "failed"
        RUNNING = "running"
      end
    end
  end
end
